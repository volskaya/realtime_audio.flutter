import AVFoundation

class RealtimeAudioSession {
  #if os(iOS)
    let instance = AVAudioSession.sharedInstance()
  #endif

  var sampleRate: Double? {
    #if os(iOS)
      return instance.sampleRate
    #else
      return nil
    #endif
  }

  func configure(recorderEnabled: Bool) throws {
    #if os(iOS)
      if !recorderEnabled {
        try instance.setCategory(.playback, mode: .spokenAudio, options: [.duckOthers])
        try instance.setPreferredInputOrientation(.portrait)
      } else {
        try instance.setCategory(
          .playAndRecord, mode: .videoChat, options: [.defaultToSpeaker, .allowBluetooth, .duckOthers])
        try instance.setPreferredInputOrientation(.portrait)
        try instance.setAllowHapticsAndSystemSoundsDuringRecording(false)
      }
    #endif
  }

  func activate() throws {
    #if os(iOS)
      try instance.setActive(true, options: [.notifyOthersOnDeactivation])
    #endif
  }

  func deactivate() throws {
    #if os(iOS)
      try instance.setActive(false)
    #endif
  }
}
