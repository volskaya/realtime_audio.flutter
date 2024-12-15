package dev.volskaya.realtime_audio.utils

import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioTrack
import android.os.Handler
import android.os.Looper
import dev.volskaya.realtime_audio.QueuedChunk
import dev.volskaya.realtime_audio.getBitRatio
import java.lang.ref.WeakReference

class ChunkAudioTrack(
  attributes: AudioAttributes,
  format: AudioFormat,
  bufferSizeInBytes: Int,
  mode: Int,
  sessionId: Int,
  chunkAudioEventListener: ChunkAudioEventListener
) : AudioTrack(
  attributes,
  format,
  bufferSizeInBytes,
  mode,
  sessionId
) {
  private var thread: Thread? = null
  private val mainLooperHandler = Handler(Looper.getMainLooper())
  private val eventListener = WeakReference(chunkAudioEventListener)
  private var isChunkQueueStartedNeeded = true

  val queue: MutableList<QueuedChunk> = mutableListOf()
  val totalDataSize: Int get() = queue.lastOrNull()?.let { it.offset + it.data.size } ?: 0
  val totalSampleTime: Int get() = totalDataSize / bitRatio

  val bitRatio: Int get() = format.getBitRatio()
  val dataPlaybackHeadPosition: Int get() = playbackHeadPosition * bitRatio
  val dataSampleRate: Int get() = sampleRate * bitRatio

  fun queue(id: String, data: ByteArray) {
    if (data.isEmpty()) return

    val queuedChunkEntry = QueuedChunk(
      id = id,
      data = data,
      offset = totalDataSize,
    )

    queue.add(queuedChunkEntry)
    eventListener.get()?.onChunkQueued(id)
  }

  override fun play() {
    if (isChunkQueueStartedNeeded && queue.isNotEmpty()) {
      queue.firstOrNull()?.let {
        isChunkQueueStartedNeeded = false
        eventListener.get()?.onChunkQueueStarted(it.id)
      }
    }

    super.play()
    thread = thread ?: Thread {
      var resumeOffset: Int? = dataPlaybackHeadPosition - (queue.firstOrNull()?.offset ?: 0)

      while (queue.isNotEmpty() && !Thread.interrupted()) {
        val chunk = queue.first()
        val data = runCatching {
          val pauseOffset = resumeOffset?.also { resumeOffset = null } ?: 0
          return@runCatching if (pauseOffset > 0) chunk.data.copyOfRange(
            pauseOffset,
            chunk.data.size
          ) else chunk.data
        }.getOrNull() ?: chunk.data

        write(data, 0, data.size)

        if (Thread.interrupted()) break
        val didRemove = queue.remove(chunk)
        if (didRemove) {
          handleChunkPlayed(chunk.id)
        }
      }

      if (!Thread.interrupted() && queue.isEmpty()) {
        handleQueueEnded()
      }
    }.also { it.start() }
  }

  private fun handleChunkPlayed(id: String) {
    mainLooperHandler.post {
      eventListener.get()?.onChunkPlayed(id)
    }
  }

  private fun handleQueueEnded() {
    thread?.interrupt()
    thread = null
    mainLooperHandler.post {
      eventListener.get()?.onChunkQueueEnded()
    }
  }

  override fun pause() {
    thread?.interrupt()
    thread = null
    super.pause()
  }

  override fun stop() {
    thread?.interrupt()
    thread = null
    isChunkQueueStartedNeeded = true
    super.stop()

    while (queue.isNotEmpty()) {
      queue.removeAt(0).let { eventListener.get()?.onChunkPlayed(it.id) }
    }
  }

  fun getCurrentChunkProps(): Map<String, Any>? {
    val sampleTime = playbackHeadPosition
    val sampleTimeTotal = totalSampleTime
    val chunk = queue.firstOrNull() ?: return null
    val offset = chunk.offset / bitRatio
    val chunkSampleTime = sampleTime - offset
    val chunkSampleTimeTotal = chunk.data.size / bitRatio

    return mapOf(
      "id" to chunk.id,
      "sampleRate" to sampleRate,
      "sampleTime" to sampleTime,
      "sampleTimeTotal" to sampleTimeTotal,
      "chunkSampleTime" to chunkSampleTime,
      "chunkSampleTimeTotal" to chunkSampleTimeTotal,
    )
  }
}
