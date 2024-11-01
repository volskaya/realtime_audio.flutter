import Foundation
import Flutter
import AVFoundation

@objc public class RealtimeAudioPlugin: NSObject, FlutterPlugin {
  let messenger: FlutterBinaryMessenger
  let methodChannel: FlutterMethodChannel
  
  private var RealtimeAudios: [String: RealtimeAudio] = [:]

  public static func register(with registrar: any FlutterPluginRegistrar) {
    let instance = RealtimeAudioPlugin(registrar)
    registrar.addMethodCallDelegate(instance, channel: instance.methodChannel)
  }

  init(_ registrar: FlutterPluginRegistrar) {
    self.messenger = registrar.messenger()
    self.methodChannel = FlutterMethodChannel(
      name: "dev.volskaya.RealtimeAudio/plugin",
      binaryMessenger: self.messenger
    )
    
    super.init()
  }
  
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
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
    var value: Any? = nil

    switch call.method {
    case "create":
      let arguments: CreateArguments = try call.toArguments()
      let id = UUID().uuidString
      let channel = FlutterMethodChannel(
        name: "dev.volskaya.RealtimeAudio/engines/\(id)",
        binaryMessenger: messenger
      )

      let engine = try RealtimeAudio(
        id: id,
        arguments: arguments,
        methodChannel: channel
      )

      RealtimeAudios[id] = engine
      value = try CreateResponse(id: id).toJsonMap()
      break
    case "destroy":
      let arguments: DestroyArguments = try call.toArguments()
      if let engine = RealtimeAudios.removeValue(forKey: arguments.id) {
        engine.dispose()
        value = try DestroyResponse().toJsonMap()
      } else {
        throw TextError("Engine not found for id: \(arguments.id).")
      }
      break
    case "getRecordPermission":
      value = try GetRecordPermissionResponse(
        permission: getRecordPermission()
      ).toJsonMap()
      break
    case "requestRecordPermission":
      value = Task<(), any Error> { [weak self] in
        guard let permission = await self?.requestRecordPermission() else { return }
        let response = try RequestRecordPermissionResponse(permission: permission).toJsonMap()
        result(response)
      }
    default:
      break  // Do nothing.
    }

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

    if value is Task<(), any Error> {
      // Do nothing, assume the Task will call result by itself, when ready.
    } else if let value {
      result(value)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func getRecordPermission() -> RealtimeAudioRecordPermission {
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
  }

  private func requestRecordPermission() async -> RealtimeAudioRecordPermission {
    if #available(iOS 17.0, *) {
      let _ = await AVAudioApplication.requestRecordPermission()
    } else {
      let _ = await withCheckedContinuation { continuation in
        AVAudioSession.sharedInstance().requestRecordPermission { status in
          continuation.resume(returning: status)
        }
      }
    }

    return getRecordPermission()
  }
}
