import AVFoundation

#if os(iOS)
  import Flutter
#else
  import FlutterMacOS
#endif

extension Int {
  func fromMsToTimeInterval() -> TimeInterval {
    TimeInterval(self) / 1000
  }
}

extension Encodable {
  func encode() throws -> Data { try JSONEncoder().encode(self) }
}

extension [String: Any] {
  func decode<T: Decodable>() throws -> T {
    try JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: self))
  }
}

extension FlutterMethodCall {
  func toArguments<T: FlutterArguments>() throws -> T {
    guard let argumentsMap = arguments as? [String: Any] else {
      throw TextError("Failed to get arguments for \(method).")
    }

    return try argumentsMap.decode() as T
  }
}

extension [AVAudioPCMBuffer] {
  func getDbfs(_ offset: Int, _ sampleAmount: Int) -> Float? {
    var currentOffset = Swift.max(0, offset)
    var remainingSamples = sampleAmount

    var sumOfSquares: Float = 0
    var totalSamples: Int = 0

    for buffer in self {
      if let channelData = buffer.floatChannelData {
        let frameLength = Int(buffer.frameLength)

        // Skip buffers until we reach the buffer containing the initial offset.
        if currentOffset >= frameLength {
          currentOffset -= frameLength
          continue
        }

        // Calculate the number of samples we can take from the current buffer.
        let samplesToTake = Swift.min(remainingSamples, frameLength - currentOffset)

        // Get the samples starting from the current offset.
        let samples = UnsafeBufferPointer(start: channelData[0] + currentOffset, count: samplesToTake)

        // Calculate the sum of squares for RMS.
        sumOfSquares += samples.map { $0 * $0 }.reduce(0, +)
        totalSamples += samplesToTake

        // Update the remaining samples and reset the current offset.
        remainingSamples -= samplesToTake
        currentOffset = 0

        // If we have collected enough samples, break the loop.
        if remainingSamples <= 0 { break }
      }

      if let channelData = buffer.int16ChannelData {
        let frameLength = Int(buffer.frameLength)

        if currentOffset >= frameLength {
          currentOffset -= frameLength
          continue
        }

        let samplesToTake = Swift.min(remainingSamples, frameLength - currentOffset)
        let samples = UnsafeBufferPointer(start: channelData[0] + currentOffset, count: samplesToTake)

        let normalizedSamples = samples.map { Float($0) / Float(Int16.max) }
        sumOfSquares += normalizedSamples.map { Float($0) * Float($0) }.reduce(0, +)
        totalSamples += samplesToTake

        remainingSamples -= samplesToTake
        currentOffset = 0

        if remainingSamples <= 0 { break }
      }
    }

    // Fill remaining samples with 0 if not enough samples were processed
    if remainingSamples > 0 {
      sumOfSquares += Float(remainingSamples * 0)
      totalSamples += remainingSamples
    }

    // If we didn't collect enough samples, return nil.
    if totalSamples == 0 { return nil }

    // Calculate RMS and dBFS.
    let rms = sqrt(sumOfSquares / Float(totalSamples))
    var dbfs = 20 * log10(rms)
    if dbfs < -96.0 { dbfs = -96.0 }

    return dbfs
  }
}

extension [ChunkEntry] {
  func getDbfs(_ offset: Int, _ sampleAmount: Int) -> Float? {
    let buffer = self.map { $0.buffer }
    let firstBufferOffset = Int(self.first?.offset ?? 0)

    return buffer.getDbfs(offset - firstBufferOffset, sampleAmount)
  }
}
