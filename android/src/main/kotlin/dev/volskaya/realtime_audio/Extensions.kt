package dev.volskaya.realtime_audio

import android.media.AudioFormat
import android.media.AudioRecord
import android.media.AudioTrack
import android.os.Handler
import android.os.Looper
import java.util.Timer
import java.util.TimerTask
import kotlin.math.log10
import kotlin.math.sqrt

fun Looper.isMainLooper(): Boolean = this == Looper.getMainLooper()

fun Timer.schedule(period: Long, run: () -> Unit): Timer {
  this.schedule(object : TimerTask() {
    override fun run() {
      run()
    }
  }, 0, period)
  return this
}

fun Timer.schedule(period: Long, handler: Handler, run: () -> Unit): Timer {
  this.schedule(object : TimerTask() {
    override fun run() {
      handler.post { run() }
    }
  }, 0, period)
  return this
}

fun AudioFormat.getMinBufferSizeRecord(): Int = AudioRecord.getMinBufferSize(sampleRate, channelMask, encoding)
fun AudioFormat.getMinBufferSizeTrack(): Int = AudioTrack.getMinBufferSize(sampleRate, channelMask, encoding)

fun getDbfsFromChunks(chunks: List<QueuedChunk>, offset: Int, sampleAmount: Int): Double? {
  val data = chunks.map { it.data }
  val firstBufferOffset = chunks.firstOrNull()?.offset ?: 0

  return getDbfsFromByteArrays(data, offset - firstBufferOffset, sampleAmount)
}

fun getDbfsFromByteArrays(data: List<ByteArray>, offset: Int, sampleAmount: Int): Double? {
  var currentOffset = maxOf(0, offset)
  var remainingSamples = sampleAmount

  var sumOfSquares = 0.0
  var totalSamples = 0

  for (byteArray in data) {
    val frameLength = byteArray.size / 2

    if (currentOffset >= frameLength) {
      currentOffset -= frameLength
      continue
    }

    val samplesToTake = minOf(remainingSamples, frameLength - currentOffset)
    if (samplesToTake <= 0) break

    for (i in 0 until samplesToTake) {
      val sampleIndex = currentOffset + i * 2
      if (sampleIndex + 1 >= byteArray.size) break

      val sample = ((byteArray[sampleIndex + 1].toInt() shl 8) or (byteArray[sampleIndex].toInt() and 0xFF)).toShort()
      val normalizedSample = sample.toDouble() / Short.MAX_VALUE
      sumOfSquares += normalizedSample * normalizedSample
    }

    totalSamples += samplesToTake
    remainingSamples -= samplesToTake
    currentOffset = 0

    if (remainingSamples <= 0) break
  }

  // Fill remaining samples with 0 if not enough samples were processed.
  if (remainingSamples > 0) {
    sumOfSquares += remainingSamples * 0.0
    totalSamples += remainingSamples
  }

  if (totalSamples == 0) return null

  val rms = sqrt(sumOfSquares / totalSamples)
  var dbfs = 20 * log10(rms)
  if (dbfs < -96.0) dbfs = -96.0

  return dbfs
}
