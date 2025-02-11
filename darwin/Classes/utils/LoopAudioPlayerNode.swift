import AVFoundation

class LoopAudioPlayerNode: AVAudioPlayerNode {
  private var inputFormat: AVAudioFormat
  private var outputFormat: AVAudioFormat

  private var converter: AVAudioConverter? = nil

  private var loopingId: String? = nil
  private var loopingData: [UInt8]? = nil
  private var loopingDataLoop: Bool = false
  
  var data: [UInt8]? { loopingData }

  init(
    inputFormat: AVAudioFormat,
    outputFormat: AVAudioFormat
  ) {
    self.inputFormat = inputFormat
    self.outputFormat = outputFormat
  }

  private func getPlayerConverter(_ from: AVAudioFormat, _ to: AVAudioFormat) throws -> AVAudioConverter {
    if let converter { return converter }
    guard let newConverter = AVAudioConverter(from: from, to: to) else {
      throw TextError("Failed to create an AVAudioConverter.")
    }
    converter = newConverter
    return newConverter
  }
  
  func queue(_ id: String, _ data: [UInt8], loop: Bool = false) throws {
    stop()
    
    if data.isEmpty { return }
    
    let converter = try getPlayerConverter(inputFormat, outputFormat)
    let buffer = try converter.convert(data)

    loopingId = id
    loopingData = data
    loopingDataLoop = loop
    scheduleBuffer(buffer) { [weak self] in
      DispatchQueue.main.async { [weak self] in
        guard let self else { return }
        if loopingId != id || !loop { return }

        try? queue(id, data, loop: loop)
        play()
      }
    }
  }

  func stop(isRestart: Bool = false) {
    if !isRestart {
      loopingId = nil
      loopingData = nil
    }
    super.stop()
  }
}

extension AVAudioConverter {
  fileprivate func convert(_ data: [UInt8]) throws -> AVAudioPCMBuffer {
    let frameLength = UInt32(data.count) / inputFormat.streamDescription.pointee.mBytesPerFrame
    let buffer = AVAudioPCMBuffer(pcmFormat: inputFormat, frameCapacity: frameLength)!
    buffer.frameLength = frameLength

    let dstLeft = buffer.int16ChannelData![0]
    data.withUnsafeBufferPointer {
      let src = UnsafeRawPointer($0.baseAddress!).bindMemory(to: Int16.self, capacity: Int(frameLength))
      dstLeft.initialize(from: src, count: Int(frameLength))
    }

    let ratio: Float = Float(inputFormat.sampleRate) / Float(outputFormat.sampleRate)
    let frameCapacity: Float = Float(buffer.frameCapacity) / ratio
    let bufferConverted = AVAudioPCMBuffer(pcmFormat: outputFormat, frameCapacity: UInt32(frameCapacity))!

    var error: NSError? = nil
    convert(to: bufferConverted, error: &error) { inNumPackets, outStatus in
      outStatus.pointee = .haveData
      return buffer
    }
    reset()

    if let error {
      throw TextError(error.localizedDescription)
    }

    return bufferConverted
  }
}
