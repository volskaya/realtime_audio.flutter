import AVFoundation

func getAudioFormat(
  _ commonFormat: AVAudioCommonFormat,
  _ sampleRate: Double,
  _ channels: UInt32,
  _ interleaved: Bool = true
) -> AVAudioFormat? {
  return .init(
    commonFormat: commonFormat,
    sampleRate: sampleRate,
    channels: channels,
    interleaved: interleaved
  )
}
