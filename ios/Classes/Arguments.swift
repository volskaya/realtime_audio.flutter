struct CreateArguments: FlutterArguments {
  var isFirstCreate: Bool
  
  var voiceProcessing: Bool
  var recorderEnabled: Bool
  
  var recorderSampleRate: Double
  var playerSampleRate: Double
  
  var playerProgressInterval: Int // In ms.
  var playerVolumeInterval: Int // In ms.
  var recorderChunkInterval: Int // In ms.
}

struct DestroyArguments: FlutterArguments {
  var id: String
}
