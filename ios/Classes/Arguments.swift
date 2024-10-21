struct CreateArguments: FlutterArguments {
  var voiceProcessing: Bool
  var recorderSampleRate: Double
  var playerSampleRate: Double
  
  var playerProgressInterval: Int // In ms.
  var playerVolumeInterval: Int // In ms.
  var recorderChunkInterval: Int // In ms.
}

struct DestroyArguments: FlutterArguments {
  var id: String
}
