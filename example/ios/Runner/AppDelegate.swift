import AVFoundation
import Flutter
import Foundation

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
//    let methodChannel = FlutterMethodChannel(
//      name: "dev.volskaya.RealtimeAudio/application",
//      binaryMessenger: controller.binaryMessenger
//    )
//
//    methodChannel.setMethodCallHandler(handleFlutterMethod)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
