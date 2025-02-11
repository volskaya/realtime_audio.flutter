package dev.volskaya.realtime_audio

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioRecord
import android.media.AudioRecord.OnRecordPositionUpdateListener
import android.media.AudioTrack
import android.media.AudioTrack.OnPlaybackPositionUpdateListener
import android.media.MediaRecorder
import android.os.Handler
import android.os.Looper
import androidx.core.app.ActivityCompat
import dev.volskaya.realtime_audio.utils.ChunkAudioTrack
import dev.volskaya.realtime_audio.utils.ChunkAudioEventListener
import dev.volskaya.realtime_audio.utils.LoopAudioTrack
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.Timer
import kotlin.math.roundToInt

data class QueuedChunk(
  val id: String,
  val data: ByteArray,
  val offset: Int,
  val pauseOffset: Int? = null,
) {
  override fun equals(other: Any?): Boolean {
    if (this === other) return true
    if (javaClass != other?.javaClass) return false

    other as QueuedChunk

    return id == other.id
  }

  override fun hashCode(): Int {
    return id.hashCode()
  }
}

class RealtimeAudio(
  private val id: String,
  private val arguments: CreateArguments,
  private val context: Context,
  private val methodChannel: MethodChannel,
) : MethodChannel.MethodCallHandler, OnPlaybackPositionUpdateListener, OnRecordPositionUpdateListener,
  ChunkAudioEventListener {

  private val mainLooperHandler = Handler(Looper.getMainLooper())

  private val recorderFormat = AudioFormat.Builder()
    .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
    .setChannelMask(AudioFormat.CHANNEL_IN_MONO)
    .setSampleRate(arguments.recorderSampleRate)
    .build()

  private val playerOutputFormat = AudioFormat.Builder()
    .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
    .setChannelMask(AudioFormat.CHANNEL_OUT_MONO)
    .setSampleRate(arguments.playerSampleRate)
    .build()

  private var recorderData: ShortArray? = null
  private val recorder: AudioRecord?
  private val audioTrack: ChunkAudioTrack
  private val audioBackgroundTrack: LoopAudioTrack?
  private val audioManager: AudioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager

  private var isRunning = false
  private var isDisposed = false
  private var shouldBeRunning = false
  private var shouldBePaused = false

  private var playerProgressTimer: Timer? = null
  private var playerVolumeTimer: Timer? = null
  private var state: RealtimeAudioState = RealtimeAudioState(
    isPlaying = false,
    isPaused = false,
    duration = 0,
    durationTotal = 0,
    chunkCount = 0
  )

  init {
    val audioSessionId = audioManager.generateAudioSessionId()

    //setPerformanceMode

    recorder = if (arguments.recorderEnabled) getRecorder() else null
    audioTrack = getAudioTrack(audioSessionId)
    audioBackgroundTrack = if (arguments.backgroundEnabled) getBackgroundTrack(audioSessionId) else null
    audioManager.mode = AudioManager.MODE_NORMAL
    methodChannel.setMethodCallHandler(this)

    audioBackgroundTrack?.setVolume(arguments.backgroundVolume.toFloat())
  }

  fun dispose() {
    isDisposed = true
    detachPlayerTimers()
    stopBackground()
    stopAudio()
    stopRecording()
    audioBackgroundTrack?.release()
    audioTrack.release()
    recorder?.release()
  }


  private fun attachPlayerTimers() {
    playerProgressTimer?.cancel()
    playerProgressTimer = Timer().schedule(arguments.playerProgressInterval) {
      mainLooperHandler.post { notifyPlayerProgress() }
    }

    playerVolumeTimer?.cancel()
    playerVolumeTimer = Timer().schedule(arguments.playerVolumeInterval) {
      mainLooperHandler.post { notifyPlayerVolume() }
    }
  }

  private fun detachPlayerTimers() {
    playerProgressTimer?.cancel()
    playerProgressTimer = null
    playerVolumeTimer?.cancel()
    playerVolumeTimer = null
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    runCatching { handleMethodCallSafe(call, result) }
      .onFailure {
        result.error(
          "INTERNAL",
          it.localizedMessage ?: "Undefined message.",
          it.stackTraceToString()
        )
      }
  }

  private fun handleMethodCallSafe(call: MethodCall, result: MethodChannel.Result) {
    var value: Any? = true

    when (call.method) {
      "queue" -> {
        val id = call.argument<String>("id") ?: throw Error("Missing id for ${call.method}.")
        val data = call.argument<ByteArray>("data") ?: throw Error("Missing data for ${call.method}.")

        queueAudio(id, data)
      }

      "clearQueue" -> {
        value = mapOf("chunk" to audioTrack.getCurrentChunkProps())
        stopAudio()
      }

      "start" -> start()
      "pause" -> pause()
      "resume" -> resume()
      "stop" -> stop()

      "stopBackground" -> stopBackground()
      "playBackground" -> {
        val id = call.argument<String>("id") ?: throw Error("Missing id for ${call.method}.")
        val data = call.argument<ByteArray>("data") ?: throw Error("Missing data for ${call.method}.")
        val loop = call.argument<Boolean>("loop") ?: throw Error("Missing loop for ${call.method}.")

        queueBackground(id, data, loop)
      }

      else -> value = null
    }

    value?.let { result.success(it) } ?: run { result.notImplemented() }
  }

  //

  private fun notifyState() {
    if (isDisposed) return
    methodChannel.invokeMethod("state", state.toMap())
  }

  private fun notifyPlayerProgress() {
    if (isDisposed) return

    var secondsTotal = 0.0
    var seconds = 0.0

    runCatching {
      secondsTotal = audioTrack.totalSampleTime.toDouble() / audioTrack.sampleRate
      seconds = audioTrack.playbackHeadPosition.toDouble() / audioTrack.sampleRate
    }

    state.duration = (seconds * 1000).roundToInt()
    state.durationTotal = (secondsTotal * 1000).roundToInt()

    notifyState()
  }

  private fun notifyPlayerState() {
    if (isDisposed) return

    state.chunkCount = audioTrack.queue.size
    state.isPaused = audioTrack.playState == AudioTrack.PLAYSTATE_PAUSED
    state.isPlaying =
      audioTrack.playState == AudioTrack.PLAYSTATE_PAUSED || audioTrack.playState == AudioTrack.PLAYSTATE_PLAYING

    notifyState()
  }

  private fun notifyPlayerVolume() {
    if (isDisposed) return

    val dbfs = runCatching {
      getDbfsFromChunks(
        audioTrack.queue,
        audioTrack.dataPlaybackHeadPosition,
        (audioTrack.dataSampleRate * 0.3).toInt()
      )
    }.getOrNull() ?: -96.0

    methodChannel.invokeMethod("playerVolume", dbfs)
  }

  private fun notifyRecorderVolume(volume: Double? = null) {
    methodChannel.invokeMethod("recorderVolume", volume ?: -96.0)
  }

  //

  private fun getAudioTrack(audioSessionId: Int? = null) =
    ChunkAudioTrack(
      AudioAttributes.Builder()
        .setLegacyStreamType(AudioManager.STREAM_MUSIC)
        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
        .setUsage(AudioAttributes.USAGE_MEDIA)
        .build(),
      playerOutputFormat,
      playerOutputFormat.getMinBufferSizeTrack(),
      AudioTrack.MODE_STREAM,
      audioSessionId ?: AudioManager.AUDIO_SESSION_ID_GENERATE,
      this
    )

  private fun getBackgroundTrack(audioSessionId: Int? = null) =
    LoopAudioTrack(
      AudioAttributes.Builder()
        .setLegacyStreamType(AudioManager.STREAM_MUSIC)
        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
        .setUsage(AudioAttributes.USAGE_MEDIA)
        .build(),
      playerOutputFormat,
      playerOutputFormat.getMinBufferSizeTrack(),
      AudioTrack.MODE_STREAM,
      audioSessionId ?: AudioManager.AUDIO_SESSION_ID_GENERATE,
    )

  private fun getRecorder(): AudioRecord {
    val permission = ActivityCompat.checkSelfPermission(context, Manifest.permission.RECORD_AUDIO)
    val isPermissionGranted = permission == PackageManager.PERMISSION_GRANTED

    if (!isPermissionGranted) {
      throw Error("No permission to record.")
    }

    val recorderChunkBufferSize =
      (recorderFormat.sampleRate.toDouble() * (arguments.recorderChunkInterval.toDouble() / 1000)).roundToInt()

    assert(recorderFormat.encoding == AudioFormat.ENCODING_PCM_16BIT)
    assert(recorderFormat.encoding == playerOutputFormat.encoding)

    val minBufferSize = recorderFormat.getMinBufferSizeRecord()
    val bufferSize = minBufferSize * recorderFormat.getBitRatio()

    return AudioRecord(
      MediaRecorder.AudioSource.MIC,
      recorderFormat.sampleRate,
      recorderFormat.channelMask,
      recorderFormat.encoding,
      bufferSize,
    ).also {
      recorderData = ShortArray(recorderChunkBufferSize)
      it.positionNotificationPeriod = recorderChunkBufferSize
      it.setRecordPositionUpdateListener(this)
    }
  }

  //

  override fun onChunkQueued(id: String) = methodChannel.invokeMethod("chunkQueued", id)
  override fun onChunkPlayed(id: String) = methodChannel.invokeMethod("chunkPlayed", id)
  override fun onChunkQueueStarted(id: String) = methodChannel.invokeMethod("chunkQueueStarted", id)
  override fun onChunkQueueEnded() = stopAudio()

  //

  private fun queueAudio(id: String, data: ByteArray) {
    if (data.isEmpty()) return

    audioTrack.queue(id, data)
    if (audioTrack.playState != AudioTrack.PLAYSTATE_PAUSED) {
      playAudio()
    }
  }

  private fun playAudio() {
    if (!shouldBeRunning || shouldBePaused) return
    if (audioTrack.queue.isEmpty()) return
    if (audioTrack.playState == AudioTrack.PLAYSTATE_PLAYING) return

    audioTrack.play()
    attachPlayerTimers()
    notifyPlayerState()
  }

  private fun pauseAudio() {
    if (audioTrack.playState != AudioTrack.PLAYSTATE_PLAYING) return
    if (audioTrack.playState == AudioTrack.PLAYSTATE_PAUSED) return

    detachPlayerTimers()
    audioTrack.pause()
    notifyPlayerState()
  }

  private fun stopAudio() {
    if (audioTrack.playState == AudioTrack.PLAYSTATE_STOPPED) return

    detachPlayerTimers()
    runCatching {
      audioTrack.stop()
      audioTrack.flush()
    }

    notifyPlayerState()
    notifyPlayerProgress()
    notifyPlayerVolume()
  }

  //

  private fun startRecording() {
    if (recorder == null || recorder.recordingState == AudioRecord.RECORDSTATE_RECORDING) return
    recorder.startRecording()
    onPeriodicNotification(recorder)
  }

  private fun stopRecording() {
    if (recorder == null || recorder.recordingState == AudioRecord.RECORDSTATE_STOPPED) return

    recorder.stop()
    notifyRecorderVolume()
  }

  private fun handleRecorderData(buffer: ByteArray, dbfs: Double? = null) {
    methodChannel.invokeMethod("recorderData", buffer)
    notifyRecorderVolume(dbfs)
  }

  //

  override fun onMarkerReached(track: AudioTrack?) {}
  override fun onPeriodicNotification(track: AudioTrack?) {}

  override fun onMarkerReached(recorder: AudioRecord?) {
    runCatching { recorderData?.let { recorder?.read(it, 0, it.size) } }
  }

  private val recorderScope: CoroutineScope = CoroutineScope(Dispatchers.IO)
  private val recorderScopeMutex = Mutex()

  override fun onPeriodicNotification(recorder: AudioRecord?) {
    recorderScope.launch {
      recorderScopeMutex.withLock {
        if (recorder?.recordingState != AudioRecord.RECORDSTATE_RECORDING) return@withLock

        val bytes = runCatching<ByteBuffer> {
          val chunkSize = recorderData
            ?.let { recorder.read(it, 0, it.size) }
            ?.also { if (it < 0) return@also } ?: return@withLock

          return@runCatching ByteBuffer.allocate(chunkSize * recorderFormat.getBitRatio()).also {
            it.order(ByteOrder.LITTLE_ENDIAN).asShortBuffer().put(recorderData)
          }
        }

        bytes.getOrNull()?.array()?.let { buffer ->
          val dbfs = getDbfsFromByteArrays(listOf(buffer), 0, buffer.size)
          scope.launch {
            handleRecorderData(buffer, dbfs)
          }
        }
      }
    }
  }

  //

  private fun queueBackground(id: String, data: ByteArray, loop: Boolean) {
    audioBackgroundTrack ?: return
    audioBackgroundTrack.queue(id, data, loop)
    playBackground()
  }

  private fun playBackground() {
    audioBackgroundTrack ?: return

    if (!isRunning) return
    if (audioBackgroundTrack.playState == AudioTrack.PLAYSTATE_PLAYING) return
    if (audioBackgroundTrack.bytes?.isNotEmpty() != true) return

    audioBackgroundTrack.play()
  }

  private fun pauseBackground() {
    audioBackgroundTrack ?: return
    audioBackgroundTrack.pause()
  }


  private fun stopBackground() {
    runCatching {
      audioBackgroundTrack ?: return
      audioBackgroundTrack.stop()
      audioBackgroundTrack.flush()
    }
  }

  //

  private fun start() {
    shouldBeRunning = true
    isRunning = true
    startRecording()
    playAudio()
  }

  private fun pause() {
    shouldBePaused = true
    pauseBackground()
    pauseAudio()
    stopRecording()
    isRunning = false
  }

  private fun resume() {
    shouldBePaused = false
    isRunning = true
    playBackground()
    playAudio()
    startRecording()
  }

  private fun stop() {
    shouldBeRunning = false
    stopBackground()
    stopAudio()
    stopRecording()
    isRunning = false
  }
}