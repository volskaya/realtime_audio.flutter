package dev.volskaya.realtime_audio

enum class RealtimeAudioRecorderPermission {
  undetermined,
  denied,
  granted
}

data class RealtimeAudioState(
  var isPlaying: Boolean,
  var isPaused: Boolean,

  var duration: Int,
  var durationTotal: Int,

  var chunkCount: Int
) {
  fun toMap(): Map<String, Any> {
    return mapOf(
      "isPlaying" to isPlaying,
      "isPaused" to isPaused,
      "duration" to duration,
      "durationTotal" to durationTotal,
      "chunkCount" to chunkCount
    )
  }
}