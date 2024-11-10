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
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
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
) : MethodChannel.MethodCallHandler, OnPlaybackPositionUpdateListener, OnRecordPositionUpdateListener {

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
  private var audioTrack: AudioTrack
  private val audioManager: AudioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager

  private var isRunning = false
  private val chunkQueue: MutableList<QueuedChunk> = mutableListOf()
  private var chunkThread: Thread? = null
  private val chunkSampleTime: Int get() = chunkQueue.lastOrNull()?.let { it.offset + it.data.size } ?: 0

  private var isChunkQueueStartedNeeded = true
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
    audioTrack = getAudioTrack()
    recorder = if (arguments.recorderEnabled) getRecorder() else null
    audioManager.mode = AudioManager.MODE_NORMAL
    methodChannel.setMethodCallHandler(this)
  }

  fun dispose() {
    detachPlayerTimers()
    stopAudio()
    stopRecording()
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
      .onFailure { result.error("INTERNAL", it.localizedMessage ?: "Undefined message.", it.stackTraceToString()) }
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
        stopAudio()
      }

      "start" -> start()
      "pause" -> pause()
      "resume" -> resume()
      "stop" -> stop()

      else -> value = null
    }

    value?.let { result.success(it) } ?: run { result.notImplemented() }
  }

  //

  private fun notifyState() {
    methodChannel.invokeMethod("state", state.toMap())
  }

  private fun notifyPlayerProgress() {
    var secondsTotal = 0.0
    var seconds = 0.0

    runCatching {
      secondsTotal = chunkSampleTime.toDouble() / audioTrack.sampleRate
      seconds = audioTrack.playbackHeadPosition.toDouble() * 2.0 / audioTrack.sampleRate
    }

    state.duration = (seconds * 1000).roundToInt()
    state.durationTotal = (secondsTotal * 1000).roundToInt()

    notifyState()
  }

  private fun notifyPlayerState() {
    state.chunkCount = chunkQueue.size
    state.isPaused = audioTrack.playState == AudioTrack.PLAYSTATE_PAUSED
    state.isPlaying =
      audioTrack.playState == AudioTrack.PLAYSTATE_PAUSED || audioTrack.playState == AudioTrack.PLAYSTATE_PLAYING

    notifyState()
  }

  private fun notifyPlayerVolume() {
    val dbfs = runCatching {
      getDbfsFromChunks(
        chunkQueue,
        audioTrack.playbackHeadPosition * 2,
        (audioTrack.sampleRate * 0.3).toInt()
      )
    }.getOrNull() ?: -96.0

    methodChannel.invokeMethod("playerVolume", dbfs)
  }

  private fun notifyRecorderVolume(volume: Double? = null) {
    methodChannel.invokeMethod("recorderVolume", volume ?: -96.0)
  }

  //

  private fun getAudioTrack() =
    AudioTrack(
      AudioAttributes.Builder()
        .setLegacyStreamType(AudioManager.STREAM_MUSIC)
        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
        .setUsage(AudioAttributes.USAGE_MEDIA)
        .build(),
      playerOutputFormat,
      playerOutputFormat.getMinBufferSizeTrack(),
      AudioTrack.MODE_STREAM,
      AudioManager.AUDIO_SESSION_ID_GENERATE
    )

  private fun getRecorder(): AudioRecord {
    val permission = ActivityCompat.checkSelfPermission(context, Manifest.permission.RECORD_AUDIO)
    val isPermissionGranted = permission == PackageManager.PERMISSION_GRANTED

    if (!isPermissionGranted) {
      throw Error("No permission to record.")
    }

    val recorderChunkBufferSize =
      (recorderFormat.sampleRate.toDouble() * (arguments.recorderChunkInterval.toDouble() / 1000)).roundToInt()

    val minBufferSize = recorderFormat.getMinBufferSizeRecord()
    val bufferSize = minBufferSize * 2

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

  private fun queueAudio(id: String, data: ByteArray) {
    if (data.isEmpty()) return

    val queuedChunkEntry = QueuedChunk(
      id = id,
      data = data,
      offset = chunkSampleTime,
    )

    chunkQueue.add(queuedChunkEntry)
    methodChannel.invokeMethod("chunkQueued", id)

    if (audioTrack.playState != AudioTrack.PLAYSTATE_PAUSED) {
      playAudio()
    }
  }

  private fun playAudio() {
    if (!isRunning) return
    if (chunkQueue.isEmpty()) return
    if (audioTrack.playState == AudioTrack.PLAYSTATE_PLAYING) return

    audioTrack.play()
    attachPlayerTimers()
    notifyPlayerState()

    if (isChunkQueueStartedNeeded && chunkQueue.isNotEmpty()) {
      isChunkQueueStartedNeeded = false
      chunkQueue.firstOrNull()?.id?.let {
        methodChannel.invokeMethod("chunkQueueStarted", it)
      }
    }

    // Build the thread only once and destroy it when the player completes
    // the queue and stops.
    if (chunkThread != null) return
    chunkThread = Thread {
      var resumeOffset: Int? = audioTrack.playbackHeadPosition * 2 - (chunkQueue.firstOrNull()?.offset ?: 0)

      while (chunkQueue.isNotEmpty() && !Thread.interrupted()) {
        val chunk = chunkQueue.first()
        val data = runCatching {
          val pauseOffset = resumeOffset?.also { resumeOffset = null } ?: 0
          return@runCatching if (pauseOffset > 0) chunk.data.copyOfRange(pauseOffset, chunk.data.size) else chunk.data
        }.getOrNull() ?: chunk.data

        audioTrack.write(data, 0, data.size)

        if (Thread.interrupted()) break // Audio could have got paused here.
        val didRemove = chunkQueue.remove(chunk)
        if (didRemove) {
          mainLooperHandler.post { methodChannel.invokeMethod("chunkPlayed", chunk.id) }
        }
      }

      if (!Thread.interrupted() && chunkQueue.isEmpty()) {
        mainLooperHandler.post { stopAudio() }
      }
    }

    chunkThread?.start()
  }

  private fun pauseAudio() {
    if (audioTrack.playState != AudioTrack.PLAYSTATE_PLAYING) return
    if (audioTrack.playState == AudioTrack.PLAYSTATE_PAUSED) return

    detachPlayerTimers()
    chunkThread?.interrupt()
    chunkThread = null
    audioTrack.pause()
    notifyPlayerState()
  }

  private fun stopAudio() {
    if (audioTrack.playState == AudioTrack.PLAYSTATE_STOPPED) return

    detachPlayerTimers()
    chunkQueue.clear()
    chunkThread?.interrupt()
    chunkThread = null
    isChunkQueueStartedNeeded = true
    runCatching {
      audioTrack.stop()
      audioTrack.flush()
    }

    while (chunkQueue.isNotEmpty()) {
      chunkQueue.removeAt(0).let {
        methodChannel.invokeMethod("chunkPlayed", "${it.id}: ${it.data.size}")
      }
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

  private fun handleRecorderData(buffer: ByteArray) {
    methodChannel.invokeMethod("recorderData", buffer)
    getDbfsFromByteArrays(listOf(buffer), 0, buffer.size).also { notifyRecorderVolume(it) }
  }

  //

  override fun onMarkerReached(track: AudioTrack?) {}
  override fun onPeriodicNotification(track: AudioTrack?) {}

  override fun onMarkerReached(recorder: AudioRecord?) {
    runCatching { recorderData?.let { recorder?.read(it, 0, it.size) } }
  }

  override fun onPeriodicNotification(recorder: AudioRecord?) {
    val buffer = runCatching<ByteBuffer> {
      val chunkSize =
        recorderData?.let { recorder?.read(it, 0, it.size) }?.also { if (it < 0) return@also } ?: return
      val buffer = ByteBuffer.allocate(chunkSize * 2).also {
        it.order(ByteOrder.LITTLE_ENDIAN).asShortBuffer().put(recorderData)
      }

      return@runCatching buffer
    }

    buffer.getOrNull()?.let { handleRecorderData(it.array()) }
  }

  //

  private fun start() {
    isRunning = true
    startRecording()
    playAudio()
  }

  private fun pause() {
    pauseAudio()
    stopRecording()
    isRunning = false
  }

  private fun resume() {
    isRunning = true
    playAudio()
    startRecording()
  }

  private fun stop() {
    stopAudio()
    stopRecording()
    isRunning = false
  }
}