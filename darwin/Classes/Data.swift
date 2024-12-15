enum RealtimeAudioRecordPermission: String, Codable {
  case undetermined
  case denied
  case granted
}

struct RealtimeAudioState: Codable {
  var isPlaying: Bool
  var isPaused: Bool

  var duration: Int
  var durationTotal: Int

  var chunkCount: Int
}
