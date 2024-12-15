import AVFoundation
import Foundation

#if os(iOS)
  import Flutter
#else
  import FlutterMacOS
#endif

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
  private var recorderConverter: AVAudioConverter?
  private let recorderPreferredBus: AVAudioNodeBus = 0
  private var recorderActiveBus: AVAudioNodeBus?
  private var recorderHasPermission: Bool {
    RealtimeAudioPlugin.getRecordPermission() == .granted
  }

  private let playerSampleRate: Double
  private let playerInputFormat: AVAudioFormat
  private let playerOutputFormat: AVAudioFormat

  private let audioSession = RealtimeAudioSession()
  private let audioEngine = AVAudioEngine()
  private let audioMixerNode = AVAudioMixerNode()
  private let audioPlayerNode: ChunkAudioPlayerNode

  private var playerVolumeTimer: Timer?
  private var playerProgressTimer: Timer?
  private var state: RealtimeAudioState = .init(
    isPlaying: false,
    isPaused: false,
    duration: 0,
    durationTotal: 0,
    chunkCount: 0
  )

  private var shouldBeStarted = false
  private var shouldBePaused = false

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

    self.playerSampleRate = arguments.playerSampleRate
    self.playerInputFormat = getAudioFormat(.pcmFormatInt16, playerSampleRate, 1)!
    self.playerOutputFormat = getAudioFormat(.pcmFormatFloat32, audioSession.sampleRate ?? playerSampleRate, 1)!

    self.audioPlayerNode = ChunkAudioPlayerNode(
      inputFormat: self.playerInputFormat,
      outputFormat: self.playerOutputFormat
    )

    super.init()

    //

    audioPlayerNode.setListener(self)
    methodChannel.setMethodCallHandler(handleFlutterMethod)

    try audioSession.configure(recorderEnabled: arguments.recorderEnabled)
    try attachNodes()
    try audioSession.activate()

    attachObservers()
    changeVolume()
    
    try installTap()
    audioEngine.prepare()
  }

  private func attachNodes() throws {
    #if os(iOS)
      if arguments.recorderEnabled {
        // Enabling voice processing affects output sound profile on built in speaker.
        try audioEngine.outputNode.setVoiceProcessingEnabled(true)
        try audioEngine.inputNode.setVoiceProcessingEnabled(true)
        audioEngine.inputNode.isVoiceProcessingAGCEnabled = false
      }
    #endif

    // Might need this later.
    let equalizer = AVAudioUnitEQ(numberOfBands: 2)
    equalizer.bypass = true

    audioEngine.attach(audioMixerNode)
    audioEngine.attach(audioPlayerNode)
    audioEngine.attach(equalizer)

    audioEngine.connect(audioPlayerNode, to: equalizer, format: playerOutputFormat)
    audioEngine.connect(equalizer, to: audioMixerNode, fromBus: 0, toBus: 0, format: playerOutputFormat)
    audioEngine.connect(audioMixerNode, to: audioEngine.mainMixerNode, format: nil)
    audioEngine.connect(audioEngine.mainMixerNode, to: audioEngine.outputNode, format: nil)
  }

  private func attachObservers() {
    #if os(iOS)
      audioSession.instance.addObserver(self, forKeyPath: "outputVolume", options: .new, context: nil)
    #endif
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(handleAudioEngineConfigurationChange),
      name: .AVAudioEngineConfigurationChange,
      object: nil
    )
  }

  @objc private func handleAudioEngineConfigurationChange(notification: NSNotification) {
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      methodChannel.invokeMethod("echo", arguments: "Audio engine configuration changed, need to restart. \(shouldBeStarted)")
      do {
        try restart()
      } catch {
        print("Failed to restart after configuration change.")
        print(error)
      }
    }
  }

  private func changeVolume() {
    if !arguments.recorderEnabled { return }
    #if os(iOS)
      audioEngine.mainMixerNode.outputVolume = audioSession.instance.outputVolume
    #endif
  }

  deinit {
    #if os(iOS)
      audioSession.instance.removeObserver(self, forKeyPath: "outputVolume")
    #endif

    methodChannel.setMethodCallHandler(nil)
    detachTimers()
    recorderConverter?.reset()
    recorderConverter = nil
    try? stop()
    try? audioSession.deactivate()
  }

  func dispose() throws {
    methodChannel.setMethodCallHandler(nil)
    detachTimers()
    try stop()
    try audioSession.deactivate()
  }

  override func observeValue(
    forKeyPath keyPath: String?,
    of object: Any?,
    change: [NSKeyValueChangeKey: Any]?,
    context: UnsafeMutableRawPointer?
  ) {
    switch keyPath {
    case "outputVolume":
      #if os(iOS)
        if audioEngine.mainMixerNode.outputVolume != audioSession.instance.outputVolume {
          changeVolume()
          assert(Thread.isMainThread)
          methodChannel.invokeMethod("echo", arguments: "Volume changing to \(audioSession.instance.outputVolume)")
        }
      #endif
      break
    default:
      break  // Do nothing
    }
  }

  private func getRecorderConverter(_ from: AVAudioFormat, _ to: AVAudioFormat) throws -> AVAudioConverter {
    guard let converter = AVAudioConverter(from: from, to: to) else {
      throw TextError("Failed to create an AVAudioConverter.")
    }
    converter.sampleRateConverterQuality = .max
    recorderConverter = converter
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
      let secondsTotal = Double(audioPlayerNode.totalSampleTime) / time.sampleRate
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
    state.chunkCount = audioPlayerNode.queue.count
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
      let dbfs = audioPlayerNode.queue.getDbfs(sampleTime, Int(time.sampleRate * 0.3))

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
        message: (error as? TextError)?.message ?? error.localizedDescription,
        details: nil
      )

      result(flutterError)
    }
  }

  private func handleFlutterMethodSafe(call: FlutterMethodCall, result: @escaping FlutterResult) throws {
    var value: Any? = true

    switch call.method {
    case "queue":
      guard let arguments = call.arguments as? [String: Any] else {
        throw TextError("Missing arguments for \(call.method)")
      }
      guard let id = arguments["id"] as? String else { throw TextError("Missing data for: \(call.method).") }
      guard let data = arguments["data"] as? FlutterStandardTypedData else {
        throw TextError("Missing data for: \(call.method).")
      }

      try queueAudio(id, [UInt8](data.data))
      break
    case "clearQueue":
      value = ["chunk": audioPlayerNode.getCurrentChunkProps()]
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
extension RealtimeAudio: ChunkAudioEventListener {
  func onChunkQueued(_ id: String) { methodChannel.invokeMethod("chunkQueued", arguments: id) }
  func onChunkPlayed(_ id: String) { methodChannel.invokeMethod("chunkPlayed", arguments: id) }
  func onChunkQueueStarted(_ id: String) { methodChannel.invokeMethod("chunkQueueStarted", arguments: id) }
  func onChunkQueueEnded() { stopAudio() }

  private func queueAudio(_ id: String, _ data: [UInt8]) throws {
    if data.isEmpty { return }

    try audioPlayerNode.queue(id, data)
    if !state.isPaused { playAudio() }
  }

  private func playAudio() {
    if shouldBePaused { return }
    if !audioEngine.isRunning { return }
    if audioPlayerNode.queue.isEmpty { return }
    if !audioPlayerNode.isPlaying {
      changeVolume()
      audioPlayerNode.play()
      attachTimers()
      notifyPlayerState(isPaused: false)
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
    detachTimers()
    audioPlayerNode.stop()

    notifyPlayerState(isPaused: false)
    notifyPlayerProgress()
    notifyPlayerVolume()
  }
}

// Recorder extension.
extension RealtimeAudio {
  private func installTap() throws {
    if !arguments.recorderEnabled { return }

    audioEngine.inputNode.removeTap(onBus: recorderPreferredBus)

    let input = audioEngine.inputNode
    let inputFormat = input.inputFormat(forBus: recorderPreferredBus)
    let ratio: Float = Float(inputFormat.sampleRate) / Float(recorderFormat.sampleRate)
    let converter = try getRecorderConverter(inputFormat, recorderFormat)
    let bufferSize = AVAudioFrameCount(inputFormat.sampleRate * Double(arguments.recorderChunkInterval) / 1000)

    input.installTap(
      onBus: recorderPreferredBus,
      bufferSize: bufferSize,
      format: inputFormat
    ) { [weak self] (buffer, time) -> Void in
      guard let self else { return }
      if self.shouldBePaused { return }

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

      if self.recorderFormat.commonFormat == AVAudioCommonFormat.pcmFormatInt16 && status == .haveData {
        self.handleRecorderData(buffer)
      }
    }
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
    shouldBeStarted = true
    try audioEngine.start()
    playAudio()
  }

  private func pause() throws {
    shouldBePaused = true
    pauseAudio()
    audioEngine.pause()
  }

  private func resume() throws {
    shouldBePaused = false
    try audioEngine.start()
    playAudio()
  }

  private func stop() throws {
    shouldBeStarted = false
    stopAudio()
    notifyRecorderVolume()
    audioEngine.stop()
  }

  private func restart() throws {
    if !shouldBeStarted { return }
    stopAudio()
    audioEngine.stop()
    audioEngine.reset()
    try attachNodes()
    try installTap()
    try start()
  }
}
