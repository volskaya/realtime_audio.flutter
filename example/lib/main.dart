import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realtime_audio/realtime_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RealtimeAudio? audioEngine;
  // StreamSubscription<Uint8List>? _subscription;

  List<StreamSubscription<dynamic>>? _subscriptions;
  RealtimeAudioState _state = const RealtimeAudioState();

  double _playerVolume = -96.0;
  double _recorderVolume = -96.0;

  double get _playerVolumeT => 1.0 - (_playerVolume / -96.0).clamp(0.0, 1.0);
  double get _recorderVolumeT => 1.0 - (_recorderVolume / -96.0).clamp(0.0, 1.0);

  List<Uint8List>? _previewData;

  void _togglePreviewRecording() {
    if (_previewData == null) {
      _previewData = [];
    } else {
      final chunks = _previewData!;
      // final allChunks = chunks.fold<Uint8List>(
      //     Uint8List(0), (previousValue, element) => Uint8List.fromList([...previousValue, ...element]));

      _previewData = null;
      // audioEngine?.queueChunk(allChunks);
      for (final chunk in chunks) {
        audioEngine?.queueChunk(chunk);
      }
    }

    setState(() {});
  }

  void _handleRecorderChunk(Uint8List chunk) {
    if (_previewData != null) {
      _previewData!.add(chunk);
    }
  }

  void createAudioEngine() {
    audioEngine = RealtimeAudio();

    _subscriptions = [
      audioEngine!.stateStream.listen((event) => setState(() => _state = event)),
      audioEngine!.recorderVolumeStream.listen((event) => setState(() => _recorderVolume = event)),
      audioEngine!.playerVolumeStream.listen((event) => setState(() => _playerVolume = event)),
      audioEngine!.recorderStream.listen(_handleRecorderChunk),
    ];

    setState(() {
      _state = audioEngine!.state;
    });
  }

  void destroyAudioEngine() {
    for (final subscription in _subscriptions ?? const []) {
      subscription.cancel();
    }
    // _subscription?.cancel();
    // _subscription = null;
    audioEngine?.dispose();
    audioEngine = null;
  }

  Future<void> clearQueue() async {
    audioEngine?.clearQueue();
  }

  Future<void> testPlayer() async {
    final file = await rootBundle.load('assets/music/shelter_evil.wav');
    final data = file.buffer.asUint8List();
    final chunks = <Uint8List>[];
    final chunkSize = data.length ~/ 10;
    // final chunkSize = 24000;

    int remaining = data.length;
    int count = 0;

    while (remaining > 0 && count < 10) {
      final start = 400 + data.length - remaining;
      final end = math.min(start + chunkSize, data.length);
      final chunk = data.sublist(start, end);

      // if (chunk.length < chunkSize) {
      //   break;
      // }

      chunks.add(chunk);
      remaining -= chunkSize;
      count += 1;
    }

    for (final chunk in chunks) {
      audioEngine?.queueCallback(() => print("Playing chunk."));
      audioEngine?.queueChunk(chunk);
      audioEngine?.queueCallback(() => print("Done playing chunk."));
    }
  }

  void startPlayer() {
    audioEngine?.start();
  }

  void pausePlayer() {
    audioEngine?.pause();
  }

  void resumePlayer() {
    audioEngine?.resume();
  }

  void stopPlayer() {
    audioEngine?.stop();
  }

  void startRecording() {
    // audioEngine?.startRecording();
  }

  void stopRecording() {
    // audioEngine?.stopRecording();
  }

  Future<void> getPermission() async {
    final permission = await RealtimeAudio.getRecordPermission();
    print(permission);
  }

  Future<void> requestPermission() async {
    final permission = await RealtimeAudio.requestRecordPermission();
    print(permission);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    destroyAudioEngine();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: createAudioEngine,
                child: const Text('Create Audio Engine'),
              ),
              ElevatedButton(
                onPressed: destroyAudioEngine,
                child: const Text('Destroy Audio Engine'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: startPlayer,
                child: const Text('Start Player'),
              ),
              ElevatedButton(
                onPressed: stopPlayer,
                child: const Text('Stop Player'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: pausePlayer,
                child: const Text('Pause Player'),
              ),
              ElevatedButton(
                onPressed: resumePlayer,
                child: const Text('Resume Player'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: testPlayer,
                child: const Text('Queue Something'),
              ),
              ElevatedButton(
                onPressed: clearQueue,
                child: const Text('Clear Queue'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: getPermission,
                child: const Text('Get Permission'),
              ),
              ElevatedButton(
                onPressed: requestPermission,
                child: const Text('Request Permission'),
              ),
              ElevatedButton(
                onPressed: _togglePreviewRecording,
                child: Text(_previewData != null ? 'End Preview' : 'Start Preview'),
              ),
              const SizedBox(height: 24),
              ProgressIndicator(t: _state.duration / math.max(1, _state.durationTotal)),
              const SizedBox(height: 16),
              ProgressIndicator(t: _playerVolumeT),
              const SizedBox(height: 16),
              ProgressIndicator(t: _recorderVolumeT),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.t,
  });

  final double t;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 8,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: ShapeDecoration(shape: const StadiumBorder(), color: colors.surfaceContainerHigh),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOutCubicEmphasized,
              height: double.infinity,
              width: constraints.maxWidth * t,
              decoration: ShapeDecoration(shape: const StadiumBorder(), color: colors.primary),
            ),
          ],
        );
      }),
    );
  }
}
