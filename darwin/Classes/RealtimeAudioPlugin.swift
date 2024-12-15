import AVFoundation
import Foundation

#if os(iOS)
  import Flutter
#else
  import FlutterMacOS
#endif

@objc public class RealtimeAudioPlugin: NSObject, FlutterPlugin {
  let messenger: FlutterBinaryMessenger
  let methodChannel: FlutterMethodChannel

  private var realtimeAudioInstances: [String: RealtimeAudio] = [:]

  public static func register(with registrar: any FlutterPluginRegistrar) {
    let instance = RealtimeAudioPlugin(registrar)
    registrar.addMethodCallDelegate(instance, channel: instance.methodChannel)
  }

  init(_ registrar: FlutterPluginRegistrar) {
    #if os(iOS)
      self.messenger = registrar.messenger()
    #else
      self.messenger = registrar.messenger
    #endif

    self.methodChannel = FlutterMethodChannel(
      name: "dev.volskaya.RealtimeAudio/plugin",
      binaryMessenger: self.messenger
    )

    super.init()
  }

  public func detachFromEngine(for registrar: any FlutterPluginRegistrar) {
    disposeAllInstances()
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
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
    var value: Any? = nil

    switch call.method {
    case "create":
      let arguments: CreateArguments = try call.toArguments()

      if !realtimeAudioInstances.isEmpty {
        if arguments.isFirstCreate {
          disposeAllInstances()
        } else {
          throw TextError("Only 1 active RealtimeAudio instance allowed at a time.")
        }
      }

      let id = UUID().uuidString
      let channel = FlutterMethodChannel(
        name: "dev.volskaya.RealtimeAudio/engines/\(id)",
        binaryMessenger: messenger
      )

      let instance = try RealtimeAudio(
        id: id,
        arguments: arguments,
        methodChannel: channel
      )

      realtimeAudioInstances[id] = instance
      value = try CreateResponse(id: id).toJsonMap()
      break
    case "destroy":
      let arguments: DestroyArguments = try call.toArguments()
      if let engine = realtimeAudioInstances.removeValue(forKey: arguments.id) {
        try? engine.dispose()
        value = try DestroyResponse().toJsonMap()
      } else {
        throw TextError("Engine not found for id: \(arguments.id).")
      }
      break
    case "getRecordPermission":
      let permission = RealtimeAudioPlugin.getRecordPermission()
      value = try GetRecordPermissionResponse(permission: permission).toJsonMap()
      break
    case "requestRecordPermission":
      value = Task<(), any Error> { [weak self] in
        let permission = await RealtimeAudioPlugin.requestRecordPermission()
        let response = try RequestRecordPermissionResponse(permission: permission).toJsonMap()
        if self != nil { result(response) }
      }
    default:
      break  // Do nothing.
    }

    #if os(iOS)
      if #available(iOS 15.0, *) {
        switch call.method {
        case "isVoiceIsolationEnabled":
          value = AVCaptureDevice.preferredMicrophoneMode == .voiceIsolation
          break
        case "openMicrophoneModeSettings":
          AVCaptureDevice.showSystemUserInterface(.microphoneModes)
          value = true
          break
        case "getPreferredMicrophoneMode":
          value = AVCaptureDevice.preferredMicrophoneMode.rawValue
          break
        case "getActiveMicrophoneMode":
          value = AVCaptureDevice.activeMicrophoneMode.rawValue
          break
        default:
          break  // Do nothing.
        }
      }
    #endif

    if value is Task<(), any Error> {
      // Do nothing, assume the Task will call result by itself, when ready.
    } else if let value {
      result(value)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func disposeAllInstances() {
    let instances = realtimeAudioInstances
    realtimeAudioInstances = [:]
    for instance in instances.values {
      try? instance.dispose()
    }
  }

  static func getRecordPermission() -> RealtimeAudioRecordPermission {
    #if os(iOS)
      if #available(iOS 17.0, *) {
        switch AVAudioApplication.shared.recordPermission {
        case .undetermined:
          return .undetermined
        case .denied:
          return .denied
        case .granted:
          return .granted
        @unknown default:
          return .undetermined
        }
      } else {
        switch AVAudioSession.sharedInstance().recordPermission {
        case .undetermined:
          return .undetermined
        case .denied:
          return .denied
        case .granted:
          return .granted
        @unknown default:
          return .undetermined
        }
      }
    #else
      switch AVCaptureDevice.authorizationStatus(for: .audio) {
      case .notDetermined:
        return .undetermined
      case .restricted:
        return .denied
      case .denied:
        return .denied
      case .authorized:
        return .granted
      @unknown default:
        return .undetermined
      }
    #endif
  }

  static func requestRecordPermission() async -> RealtimeAudioRecordPermission {
    #if os(iOS)
      if #available(iOS 17.0, *) {
        let _ = await AVAudioApplication.requestRecordPermission()
      } else {
        let _ = await withCheckedContinuation { continuation in
          AVAudioSession.sharedInstance().requestRecordPermission { status in
            continuation.resume(returning: status)
          }
        }
      }
    #else
      let _ = await AVCaptureDevice.requestAccess(for: .audio)
    #endif

    return getRecordPermission()
  }
}
