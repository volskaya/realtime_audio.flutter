package dev.volskaya.realtime_audio.utils

import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioTrack
import dev.volskaya.realtime_audio.getBitRatio

class LoopAudioTrack(
  attributes: AudioAttributes,
  format: AudioFormat,
  bufferSizeInBytes: Int,
  mode: Int,
  sessionId: Int
) : AudioTrack(
  attributes,
  format,
  bufferSizeInBytes,
  mode,
  sessionId
) {
  private var playingId: String? = null
  private var playingBytes: ByteArray? = null
  private var playingBytesLoop: Boolean = false
  private var thread: Thread? = null

  private val bitRatio: Int get() = format.getBitRatio()
  private val dataPlaybackHeadPosition: Int get() = playbackHeadPosition * bitRatio

  val bytes: ByteArray?
    get() {
      return playingBytes
    }

  fun queue(id: String, data: ByteArray, loop: Boolean) {
    runCatching {
      stop()
    }

    playingId = id
    playingBytes = data
    playingBytesLoop = loop
  }

  override fun play() {
    val bytes = playingBytes ?: return // Nothing to play

    super.play()
    thread = thread ?: Thread {
      val currentThread = Thread.currentThread()
      val resumeOffset: Int = dataPlaybackHeadPosition % bytes.size
      val data = if (resumeOffset > 0) bytes.copyOfRange(resumeOffset, bytes.size) else bytes

      while (currentThread == thread && !currentThread.isInterrupted && playState == PLAYSTATE_PLAYING) {
        write(data, 0, data.size)
        if (currentThread != thread || currentThread.isInterrupted || !playingBytesLoop) break
      }

      if (currentThread == thread && !currentThread.isInterrupted) {
        stop()
      }
    }.also { it.start() }
  }

  override fun pause() {
    thread?.interrupt()
    thread = null
    super.pause()
  }

  override fun stop() {
    thread?.interrupt()
    thread = null
    playingId = null
    playingBytes = null
    playingBytesLoop = false
    super.pause()
    super.flush()
    super.stop()
  }
}