// ignore_for_file: avoid_print

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
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
          dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
        ),
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
  static const _printTimeDifferences = false;

  RealtimeAudio? audioEngine;
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
      _previewData = null;
      for (final chunk in chunks) {
        audioEngine?.queueChunk(chunk);
      }
    }

    setState(() {});
  }

  DateTime? _lastRecorderChunk;
  DateTime? _lastPlayerChunk;

  void _handleRecorderChunk(Uint8List chunk) {
    if (_previewData == null) return;
    if (_printTimeDifferences) {
      if (_lastRecorderChunk != null) {
        final diff = DateTime.now().difference(_lastRecorderChunk!);
        final chunkMs = chunk.length / 48000 * 1000;
        print("Chunk time: ${diff.inMilliseconds}ms, chunkMs: $chunkMs");
      }
      _lastRecorderChunk = DateTime.now();
    }
    _previewData?.add(chunk);
  }

  void _handlePlayerState(RealtimeAudioState state) {
    if (_printTimeDifferences) {
      if (_lastPlayerChunk != null) {
        final diff = DateTime.now().difference(_lastPlayerChunk!);
        print("Player time: ${diff.inMilliseconds}ms");
      }
      _lastPlayerChunk = DateTime.now();
    }
    setState(() => _state = state);
  }

  Future<void> createAudioEngine({
    bool recorderEnabled = false,
  }) async {
    final audioEngineNew = RealtimeAudio(recorderEnabled: recorderEnabled, backgroundEnabled: true);
    await audioEngineNew.isInitialized;

    setState(() {
      audioEngine = audioEngineNew;
      _state = audioEngine!.state;
      _subscriptions = [
        audioEngine!.stateStream.listen(_handlePlayerState),
        audioEngine!.recorderVolumeStream.listen((event) => setState(() => _recorderVolume = event)),
        audioEngine!.playerVolumeStream.listen((event) => setState(() => _playerVolume = event)),
        audioEngine!.recorderStream.listen(_handleRecorderChunk),
      ];
    });
  }

  void destroyAudioEngine() {
    for (final subscription in _subscriptions ?? const []) {
      subscription.cancel();
    }
    audioEngine?.dispose();
    audioEngine = null;
  }

  Future<void> clearQueue() async {
    final resp = await audioEngine?.clearQueue();
    print(resp);
    print("Stopped at: ${resp?.chunk?.elapsed}, chunk: ${resp?.chunk?.chunkElapsed}");
  }

  Future<void> testPlayer() async {
    final file = await rootBundle.load('assets/audio/voice.wav');
    final data = file.buffer.asUint8List();
    final chunks = <Uint8List>[];

    const chunkSize = 24000 * 2 * 4;
    const chunkOffset = 88;

    int remaining = data.length;

    while (remaining > 0) {
      final start = chunkOffset + data.length - remaining;
      final end = math.min(start + chunkSize, data.length);
      final chunk = data.sublist(start, end);

      assert(chunk.length % 2 == 0);

      chunks.add(chunk);
      remaining -= chunkSize;
    }

    for (final chunk in chunks) {
      audioEngine?.queueCallback(() => print("Playing chunk."));
      audioEngine?.queueChunk(chunk);
      audioEngine?.queueCallback(() => print("Done playing chunk."));
    }
  }

  Future<void> startPlayer() async => audioEngine?.start();
  Future<void> pausePlayer() async => audioEngine?.pause();
  Future<void> resumePlayer() async => audioEngine?.resume();
  Future<void> stopPlayer() async => audioEngine?.stop();

  Future<void> getPermission() async {
    final permission = await RealtimeAudio.getRecordPermission();
    print(permission);
  }

  Future<void> requestPermission() async {
    final permission = await RealtimeAudio.requestRecordPermission();
    print(permission);
  }

  Future<void> stopBackground() async => audioEngine?.stopBackground();
  Future<void> playBackground() async {
    await audioEngine?.playBackground(
      (await rootBundle.load('assets/audio/background.wav')).buffer.asUint8List(),
      loop: true,
    );
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            clipBehavior: Clip.none,
            children: <Widget>[
              const SizedBox(height: 24),
              ProgressIndicator(t: _state.duration / math.max(1, _state.durationTotal)),
              const SizedBox(height: 16),
              ProgressIndicator(t: _playerVolumeT),
              const SizedBox(height: 16),
              ProgressIndicator(t: _recorderVolumeT),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => createAudioEngine(recorderEnabled: true),
                child: const Text('Create Audio Engine (With Recording)'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => createAudioEngine(recorderEnabled: false),
                child: const Text('Create Audio Engine (Without Recording)'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: destroyAudioEngine,
                child: const Text('Destroy Audio Engine'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: startPlayer,
                child: const Text('Start Player'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: stopPlayer,
                child: const Text('Stop Player'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: pausePlayer,
                child: const Text('Pause Player'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: resumePlayer,
                child: const Text('Resume Player'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: testPlayer,
                child: const Text('Queue Something'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: clearQueue,
                child: const Text('Clear Queue'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: playBackground,
                child: const Text('Test Background'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: stopBackground,
                child: const Text('Stop Background'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: getPermission,
                child: const Text('Get Permission'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: requestPermission,
                child: const Text('Request Permission'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _togglePreviewRecording,
                child: Text(_previewData != null ? 'End Preview' : 'Start Preview'),
              ),
              const SizedBox(height: 24),
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
