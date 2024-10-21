# 🎵 Realtime Audio

`RealtimeAudio` is a Flutter package that handles audio recording and playback of data chunks from real-time sources, like OpenAI Realtime API or HumeAI Voice.

## ✨ Features

- 🎤 Audio recording with variable chunk length in milliseconds.
- 🔊 Audio playback of data chunks.
- ⏱️ Duration tracking of audio chunks.
- 🔒 Necessary permission & audio session handling.
- ⏸️ Pause support.
- 🎛️ Voice processing on iOS.

## 📖 Usage

To use this package, add `realtime_audio` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

After initializing the `RealtimeAudio` object, you can start recording and playing audio chunks by calling `start()`.

Audio will be played back in real-time, as soon as the first chunk is queued with `queueChunk()`.

See the example project for a complete example.
