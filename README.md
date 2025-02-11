# 🎵 Realtime Audio

`RealtimeAudio` is a Flutter package that handles audio recording and playback of data chunks from real-time sources, like OpenAI Realtime, ElevenLabs or HumeAI Voice.

## ✨ Features

- 🎤 Audio recording with variable chunk length in milliseconds.
- 🔊 Audio playback of data chunks.
- ⏱️ Duration tracking of audio chunks.
- ⏸️ Pause support.
- 📊 Volume tracking in dBFS.
- 🎛️ Voice isolation and other processing on iOS.
- 📱 iOS audio session handling for max volume.
- 🤖🍏🍎 Android, iOS, and macOS support.
- ✂️ Audio response truncation support.
- 🎵 Background audio track support.

## 📖 Usage

To use this package, add `realtime_audio` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

After initializing the `RealtimeAudio` object, you can start recording and playing audio chunks by calling `start()`.

Audio will be played back in real-time, as soon as the first chunk is queued with `queueChunk()`.

See the example project for a complete example.

## 🔒 Permissions

### 🤖 Android

- **Add Permissions to `AndroidManifest.xml`**:

  ```xml
  <uses-permission android:name="android.permission.RECORD_AUDIO"/>
  ```

### 🍏 iOS

- **Add Permissions to `Info.plist`**:
  Open your `Info.plist` file and add the following keys:

  ```xml
  <key>NSMicrophoneUsageDescription</key>
  <string>We need access to the microphone to record audio.</string>
  ```

### 🍎 macOS

- **Add Permissions to `Info.plist`**:
  Open your `Info.plist` file and add the following keys:

  ```xml
  <key>NSMicrophoneUsageDescription</key>
  <string>We need access to the microphone to record audio.</string>
  ```

- **Add Entitlements to release and debug `macos/*.entitlements`**:
  Open your `macos/*.entitlements` file and add the following:

  ```xml
  <key>com.apple.security.device.audio-input</key>
  <true/>
  ```

  Can also do this through XCode by selecting the target, then `Signing & Capabilities`, then checking `Audio Input`.
