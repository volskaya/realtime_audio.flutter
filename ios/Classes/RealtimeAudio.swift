import AVFoundation
import Flutter
import UIKit

struct ChunkEntry {
  var id: String
  var buffer: AVAudioPCMBuffer
  var offset: UInt32
}

class RealtimeAudio: NSObject {
  let id: String
  let arguments: CreateArguments
  let methodChannel: FlutterMethodChannel

  private let recorderSampleRate: Double
  private let recorderFormat: AVAudioFormat
  private let recorderBufferSize: AVAudioFrameCount

  private let playerSampleRate: Double
  private let playerInputFormat: AVAudioFormat
  private let playerOutputFormat: AVAudioFormat

  private let audioSession = AVAudioSession.sharedInstance()
  private let audioEngine = AVAudioEngine()
  private let audioPlayerNode = AVAudioPlayerNode()
  private let audioBus = 0

  private var chunkQueue: [ChunkEntry] = []
  private var chunkThread: Task<(), Never>? = nil
  private var chunkSampleTime: UInt32 {
    return (chunkQueue.last?.offset ?? 0) + (chunkQueue.last?.buffer.frameLength ?? 0)
  }

  private var playerConverter: AVAudioConverter?
  private var recorderConverter: AVAudioConverter?

  private var isChunkQueueStartedNeeded = false
  private var playerVolumeTimer: Timer?
  private var playerProgressTimer: Timer?
  private var state: RealtimeAudioState = .init(
    isPlaying: false,
    isPaused: false,
    duration: 0,
    durationTotal: 0,
    chunkCount: 0
  )

  init(
    id: String,
    arguments: CreateArguments,
    methodChannel: FlutterMethodChannel
  ) throws {
    self.id = id
    self.arguments = arguments
    self.methodChannel = methodChannel

    self.recorderSampleRate = arguments.recorderSampleRate
    self.recorderFormat = getAudioFormat(.pcmFormatInt16, recorderSampleRate, 1)!
    self.recorderBufferSize = AVAudioFrameCount(
      Int(recorderSampleRate * Double(arguments.recorderChunkInterval / 1000)))

    self.playerSampleRate = arguments.playerSampleRate
    self.playerInputFormat = getAudioFormat(.pcmFormatInt16, playerSampleRate, 1)!
    self.playerOutputFormat = getAudioFormat(.pcmFormatFloat32, audioSession.sampleRate, 1)!

    super.init()

    //

    methodChannel.setMethodCallHandler(handleFlutterMethod)

    try audioSession.setCategory(.playAndRecord, mode: .videoChat, options: [.defaultToSpeaker, .allowBluetooth])
    try audioSession.setPreferredInputOrientation(.portrait)

    if #available(iOS 13.0, *) {
      try audioSession.setAllowHapticsAndSystemSoundsDuringRecording(false)

      try audioEngine.outputNode.setVoiceProcessingEnabled(true)
      try audioEngine.inputNode.setVoiceProcessingEnabled(true)
      audioEngine.inputNode.isVoiceProcessingAGCEnabled = false
    }

    // Might need this later.
    let equalizer = AVAudioUnitEQ(numberOfBands: 2)
    equalizer.bypass = true

    audioEngine.attach(audioPlayerNode)
    audioEngine.attach(equalizer)

    audioEngine.connect(audioPlayerNode, to: equalizer, format: playerOutputFormat)
    audioEngine.connect(equalizer, to: audioEngine.mainMixerNode, format: playerOutputFormat)
    audioEngine.connect(audioEngine.mainMixerNode, to: audioEngine.outputNode, format: playerOutputFormat)

    try audioSession.setActive(true, options: [.notifyOthersOnDeactivation])

    audioEngine.prepare()
    audioSession.addObserver(self, forKeyPath: "outputVolume", options: .new, context: nil)
    audioEngine.mainMixerNode.outputVolume = audioSession.outputVolume
  }

  deinit {
    audioSession.removeObserver(self, forKeyPath: "outputVolume")
    methodChannel.setMethodCallHandler(nil)
    try? stop()
    try? audioSession.setActive(false)
  }

  func dispose() {
    methodChannel.setMethodCallHandler(nil)
    try? stop()
    try? audioSession.setActive(false)
  }

  override func observeValue(
    forKeyPath keyPath: String?,
    of object: Any?,
    change: [NSKeyValueChangeKey: Any]?,
    context: UnsafeMutableRawPointer?
  ) {
    switch keyPath {
    case "outputVolume":
      if audioEngine.mainMixerNode.outputVolume != audioSession.outputVolume {
        audioEngine.mainMixerNode.outputVolume = audioSession.outputVolume
        assert(Thread.isMainThread)
        methodChannel.invokeMethod("echo", arguments: "Volume changing to \(audioSession.outputVolume)")
      }
      break
    default:
      break  // Do nothing
    }
  }

  private func getRecorderConverter(_ from: AVAudioFormat, _ to: AVAudioFormat) throws -> AVAudioConverter {
    if let recorderConverter { return recorderConverter }
    guard let converter = AVAudioConverter(from: from, to: to) else { throw TextError("Failed to create an AVAudioConverter.") }
    recorderConverter = converter
    return converter
  }

  private func getPlayerConverter(_ from: AVAudioFormat, _ to: AVAudioFormat) throws -> AVAudioConverter {
    if let playerConverter { return playerConverter }
    guard let converter = AVAudioConverter(from: from, to: to) else { throw TextError("Failed to create an AVAudioConverter.") }
    playerConverter = converter
    return converter
  }

  private func attachTimers() {
    let progressInterval: TimeInterval = arguments.playerProgressInterval.fromMsToTimeInterval()
    let volumeInterval: TimeInterval = arguments.playerVolumeInterval.fromMsToTimeInterval()

    playerProgressTimer =
      self.playerProgressTimer
      ?? Timer.scheduledTimer(withTimeInterval: progressInterval, repeats: true) { [weak self] timer in
        if let self { self.notifyPlayerProgress() } else { timer.invalidate() }
      }

    playerVolumeTimer =
      self.playerVolumeTimer
      ?? Timer.scheduledTimer(withTimeInterval: volumeInterval, repeats: true) { [weak self] timer in
        if let self { self.notifyPlayerVolume() } else { timer.invalidate() }
      }
  }

  private func detachTimers() {
    playerVolumeTimer?.invalidate()
    playerVolumeTimer = nil
    playerProgressTimer?.invalidate()
    playerProgressTimer = nil
  }

  private func notifyState() {
    DispatchQueue.main.async { [weak self] in
      guard let self, let json = try? self.state.toJsonMap() else { return }
      assert(Thread.isMainThread)
      self.methodChannel.invokeMethod("state", arguments: json)
    }
  }

  private func notifyPlayerProgress() {
    var duration: Int = 0
    var durationTotal: Int = 0

    if let lastTime = audioPlayerNode.lastRenderTime,
      let time = audioPlayerNode.playerTime(forNodeTime: lastTime)
    {
      let sampleTimeDouble = Double(time.sampleTime)
      let secondsTotal = Double(chunkSampleTime) / time.sampleRate
      let seconds = sampleTimeDouble / time.sampleRate

      duration = max(0, Int((seconds * 1000).rounded()))
      durationTotal = max(0, Int((secondsTotal * 1000).rounded()))
    }

    DispatchQueue.main.async { [weak self] in
      guard let self else { return }

      self.state.duration = duration
      self.state.durationTotal = durationTotal
      self.notifyState()
    }
  }

  private func notifyPlayerState(
    isPaused: Bool?
  ) {
    state.chunkCount = chunkQueue.count
    state.isPlaying = audioPlayerNode.isPlaying
    if let isPaused { state.isPaused = isPaused }
    notifyState()
  }

  private func notifyPlayerVolume() {
    var volume: Float = -96.0

    if let lastTime = audioPlayerNode.lastRenderTime,
      let time = audioPlayerNode.playerTime(forNodeTime: lastTime)
    {
      let sampleTime = Int(time.sampleTime)
      let dbfs = chunkQueue.getDbfs(sampleTime, Int(time.sampleRate * 0.3))

      if let dbfs { volume = dbfs }
    }

    DispatchQueue.main.async { [weak self] in
      self?.methodChannel.invokeMethod("playerVolume", arguments: volume)
    }
  }

  func notifyRecorderVolume(_ volume: Float? = nil) {
    methodChannel.invokeMethod("recorderVolume", arguments: volume ?? -96.0)
  }
}

extension RealtimeAudio {
  private func handleFlutterMethod(call: FlutterMethodCall, result: @escaping FlutterResult) {
    do {
      try handleFlutterMethodSafe(call: call, result: result)
    } catch {
      let flutterError = FlutterError(
        code: "INTERNAL",
        message: error.localizedDescription,
        details: nil
      )

      result(flutterError)
    }
  }

  private func handleFlutterMethodSafe(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
    var value: Any? = true

    switch call.method {
    case "queue":
      guard let arguments = call.arguments as? [String: Any] else { throw TextError("Missing arguments for \(call.method)") }
      guard let id = arguments["id"] as? String else { throw TextError("Missing data for: \(call.method).") }
      guard let data = arguments["data"] as? FlutterStandardTypedData else { throw TextError("Missing data for: \(call.method).") }

      try queueAudio(id, [UInt8](data.data))
      break
    case "clearQueue":
      stopAudio()
      break
    case "start":
      try start()
      break
    case "pause":
      try pause()
      break
    case "resume":
      try resume()
      break
    case "stop":
      try stop()
      break
    default:
      value = nil
      break  // Do nothing
    }

    if let value {
      result(value)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}

// Player extension.
extension RealtimeAudio {
  private func queueAudio(_ id: String, _ data: [UInt8]) throws {
    if data.isEmpty { return }

    let converter = try getPlayerConverter(playerInputFormat, playerOutputFormat)
    let frameLength = UInt32(data.count) / playerInputFormat.streamDescription.pointee.mBytesPerFrame
    let buffer = AVAudioPCMBuffer(pcmFormat: playerInputFormat, frameCapacity: frameLength)!
    buffer.frameLength = frameLength

    let dstLeft = buffer.int16ChannelData![0]
    data.withUnsafeBufferPointer {
      let src = UnsafeRawPointer($0.baseAddress!).bindMemory(to: Int16.self, capacity: Int(frameLength))
      dstLeft.initialize(from: src, count: Int(frameLength))
    }

    let ratio: Float = Float(playerInputFormat.sampleRate) / Float(playerOutputFormat.sampleRate)
    let frameCapacity: Float = Float(buffer.frameCapacity) / ratio
    let bufferConverted = AVAudioPCMBuffer(pcmFormat: playerOutputFormat, frameCapacity: UInt32(frameCapacity))!

    var error: NSError? = nil
    converter.convert(to: bufferConverted, error: &error) { inNumPackets, outStatus in
      outStatus.pointee = .haveData
      return buffer
    }
    converter.reset()

    if let error {
      throw TextError(error.localizedDescription)
    }

    let entry = ChunkEntry(
      id: id,
      buffer: bufferConverted,
      offset: chunkSampleTime
    )

    chunkQueue.append(entry)
    DispatchQueue.main.async { [weak self] in self?.methodChannel.invokeMethod("chunkQueued", arguments: id) }

    audioPlayerNode.scheduleBuffer(entry.buffer) { [weak self] in
      DispatchQueue.main.async { [weak self] in
        guard let self else { return }

        let chunkQueueCountBefore = self.chunkQueue.count
        self.chunkQueue.removeAll { $0.id == entry.id }
        let didRemove = self.chunkQueue.count < chunkQueueCountBefore

        if didRemove {
          if chunkQueue.count == 0 { self.stopAudio() }
          self.methodChannel.invokeMethod("chunkPlayed", arguments: id)
        }
      }
    }

    if !state.isPaused { playAudio() }
  }

  private func playAudio() {
    if !audioEngine.isRunning { return }
    if chunkQueue.isEmpty { return }
    if !audioPlayerNode.isPlaying {
      audioEngine.mainMixerNode.outputVolume = audioSession.outputVolume
      audioPlayerNode.play()
      attachTimers()
      notifyPlayerState(isPaused: false)

      if isChunkQueueStartedNeeded, let firstChunkId = chunkQueue.first?.id {
        isChunkQueueStartedNeeded = false
        self.methodChannel.invokeMethod("chunkQueueStarted", arguments: firstChunkId)
      }
    }
  }

  private func pauseAudio() {
    if !audioEngine.isRunning { return }
    if !audioPlayerNode.isPlaying { return }
    audioPlayerNode.pause()
    detachTimers()
    notifyPlayerState(isPaused: true)
  }

  private func stopAudio() {
    if !audioEngine.isRunning { return }
    chunkThread?.cancel()
    chunkThread = nil
    isChunkQueueStartedNeeded = true
    detachTimers()
    audioPlayerNode.stop()

    while !chunkQueue.isEmpty {
      let chunk = chunkQueue.removeFirst()
      assert(Thread.isMainThread)
      methodChannel.invokeMethod("chunkPlayed", arguments: chunk.id)
    }

    notifyPlayerState(isPaused: false)
    notifyPlayerProgress()
    notifyPlayerVolume()
  }
}

// Recorder extension.
extension RealtimeAudio {
  private func startRecording() throws {
    audioEngine.inputNode.removeTap(onBus: audioBus)

    let input = audioEngine.inputNode
    let inputFormat = input.inputFormat(forBus: audioBus)
    let ratio: Float = Float(inputFormat.sampleRate) / Float(recorderFormat.sampleRate)
    let converter = try getRecorderConverter(inputFormat, recorderFormat)

    input.installTap(
      onBus: audioBus,
      bufferSize: recorderBufferSize,
      format: inputFormat
    ) { [weak self] (buffer, time) -> Void in
      guard let self else { return }

      let inputCallback: AVAudioConverterInputBlock = { inNumPackets, outStatus in
        outStatus.pointee = .haveData
        return buffer
      }

      let buffer = AVAudioPCMBuffer(
        pcmFormat: self.recorderFormat,
        frameCapacity: UInt32(Float(buffer.frameCapacity) / ratio)
      )!

      var error: NSError?
      let status = converter.convert(to: buffer, error: &error, withInputFrom: inputCallback)

      if let error {
        DispatchQueue.main.async {
          self.methodChannel.invokeMethod("recorderError", arguments: error.localizedDescription)
        }
      }

      if self.recorderFormat.commonFormat == AVAudioCommonFormat.pcmFormatInt16 {
        self.handleRecorderData(buffer)
      }
    }
  }

  private func stopRecording() {
    audioEngine.inputNode.removeTap(onBus: audioBus)
    recorderConverter = nil
    notifyRecorderVolume()
  }

  private func handleRecorderData(_ buffer: AVAudioPCMBuffer) {
    // Convert buffer to UInt8 list.
    let srcLeft = buffer.int16ChannelData![0]
    let bytesPerFrame = buffer.format.streamDescription.pointee.mBytesPerFrame
    let numBytes = Int(bytesPerFrame * buffer.frameLength)

    var data = [UInt8](repeating: 0, count: numBytes)

    srcLeft.withMemoryRebound(to: UInt8.self, capacity: numBytes) { srcByteData in
      data.withUnsafeMutableBufferPointer {
        $0.baseAddress!.initialize(from: srcByteData, count: numBytes)
      }
    }

    // Send the list to Flutter.
    let flutterData = FlutterStandardTypedData(bytes: NSData(bytes: data, length: data.count) as Data)
    let volume = [buffer].getDbfs(0, Int(buffer.frameLength))

    DispatchQueue.main.async { [weak self] in
      assert(Thread.isMainThread)
      self?.methodChannel.invokeMethod("recorderData", arguments: flutterData)
      self?.notifyRecorderVolume(volume)
    }
  }
}

extension RealtimeAudio {
  private func start() throws {
    try audioEngine.start()
    try startRecording()
    playAudio()
  }

  private func pause() throws {
    pauseAudio()
    audioEngine.pause()
  }

  private func resume() throws {
    try audioEngine.start()
    playAudio()
  }

  private func stop() throws {
    stopAudio()
    stopRecording()
    audioEngine.stop()
  }
}
