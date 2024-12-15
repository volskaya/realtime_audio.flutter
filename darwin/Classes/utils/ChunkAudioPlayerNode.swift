import AVFoundation

class ChunkAudioPlayerNode: AVAudioPlayerNode {
  private var inputFormat: AVAudioFormat
  private var outputFormat: AVAudioFormat

  var queue: [ChunkEntry] = []
  var totalSampleTime: UInt32 { (queue.last?.offset ?? 0) + (queue.last?.buffer.frameLength ?? 0) }

  private var isChunkQueueStartedNeeded = true
  private var converter: AVAudioConverter? = nil
  private weak var listener: ChunkAudioEventListener? = nil

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

  func queue(_ id: String, _ data: [UInt8]) throws {
    if data.isEmpty { return }

    let converter = try getPlayerConverter(inputFormat, outputFormat)
    let buffer = try converter.convert(data)
    let entry = ChunkEntry(
      id: id,
      buffer: buffer,
      offset: totalSampleTime
    )

    queue.append(entry)
    listener?.onChunkQueued(id)
    scheduleBuffer(entry.buffer) { [weak self] in
      DispatchQueue.main.async { [weak self] in
        guard let self else { return }

        let chunkQueueCountBefore = self.queue.count
        self.queue.removeAll { $0.id == entry.id }
        let didRemove = self.queue.count < chunkQueueCountBefore

        if didRemove {
          self.handleChunkPlayed(id)
          if queue.count == 0 { self.handleQueueEnded() }
        }
      }
    }
  }

  override func play() {
    if isChunkQueueStartedNeeded, let firstChunkId = queue.first?.id {
      isChunkQueueStartedNeeded = false
      listener?.onChunkQueueStarted(firstChunkId)
    }

    super.play()
  }

  override func stop() {
    isChunkQueueStartedNeeded = true
    super.stop()

    // AVAudioPlayerNode.scheduleBuffer calls its played callback anyway, when
    // the audio has been stopped and the scheduled buffers are cleared. This
    // is just a redundancy, just in case something changes.
    //
    // Flutter code will check if the chunk is still queued, before handling
    // its removal.
    while !queue.isEmpty {
      let chunk = queue.removeFirst()
      listener?.onChunkPlayed(chunk.id)
    }
  }

  private func handleChunkPlayed(_ id: String) {
    listener?.onChunkPlayed(id)
  }

  private func handleQueueEnded() {
    listener?.onChunkQueueEnded()
  }

  func setListener(_ value: ChunkAudioEventListener) {
    listener = value
  }

  func removeListener(_ value: ChunkAudioEventListener) {
    if listener === value { listener = nil }
  }

  func getCurrentChunkProps() -> [String: Any]? {
    guard
      let lastTime = lastRenderTime,
      let time = playerTime(forNodeTime: lastTime),
      let chunk = queue.first
    else {
      return nil
    }

    let sampleTime = Int(time.sampleTime)
    let offset = Int(chunk.offset)
    let chunkSampleTime = sampleTime - offset

    return [
      "id": chunk.id,
      "sampleRate": time.sampleRate,
      "sampleTime": sampleTime,
      "sampleTimeTotal": totalSampleTime,
      "chunkSampleTime": chunkSampleTime,
      "chunkSampleTimeTotal": chunk.buffer.frameLength,
    ]
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
