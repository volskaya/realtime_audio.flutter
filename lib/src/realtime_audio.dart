import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:realtime_audio/src/data/other.dart';
import 'package:realtime_audio/src/data/realtime_audio_arguments.dart';
import 'package:realtime_audio/src/data/realtime_audio_queue_entry.dart';
import 'package:realtime_audio/src/data/realtime_audio_response.dart';
import 'package:realtime_audio/src/data/realtime_audio_state.dart';
import 'package:realtime_audio/src/utils/semaphore.dart';
import 'package:uuid/uuid.dart';

/// [RealtimeAudio] handles audio recording and audio data playback from
/// real time sources.
///
/// Call [start] to start the audio engine, which will begin recording and
/// playing audio, when ever there are chunks queued for playback.
///
/// Call [pause] to pause the audio engine, which will pause both recording
/// and playback, [resume] to resume.
///
/// Call [stop] to drop audio player queue and stop recording.
///
/// You can toggle between [start] and [stop] as many times as you want.
///
/// Call [dispose] when you are done using [RealtimeAudio].
///
/// Call [queueChunk] to queue a audio data for playback and [clearQueue] to
/// stop the current playback and clear the queue, without interrupting
/// the recorder stream.
class RealtimeAudio {
  RealtimeAudio({
    this.voiceProcessing = true,
    //
    this.recorderSampleRate = 24000,
    this.playerSampleRate = 24000,
    //
    this.playerProgressInterval = 10,
    this.playerVolumeInterval = 40,
    this.recorderChunkInterval = 40,
  }) {
    isInitialized = _initialize();
  }

  final bool voiceProcessing;
  final int recorderSampleRate;
  final int playerSampleRate;
  final int playerProgressInterval;
  final int playerVolumeInterval;
  final int recorderChunkInterval;

  late final Future<void> isInitialized;

  static const _staticChannel = MethodChannel('dev.volskaya.RealtimeAudio/plugin');
  static const _uuid = Uuid();

  final _semaphore = Semaphore(1);
  final List<RealtimeAudioQueueEntry> _queue = [];
  final Set<String> _queuedChunks = {};

  final StreamController<double> _playerVolumeStreamController = StreamController<double>();
  final StreamController<double> _recorderVolumeStreamController = StreamController<double>();
  final StreamController<Uint8List> _recorderStreamController = StreamController<Uint8List>();
  final StreamController<RealtimeAudioState> _stateStreamController = StreamController<RealtimeAudioState>();

  Stream<Uint8List> get recorderStream => _recorderStreamController.stream;
  Stream<RealtimeAudioState> get stateStream => _stateStreamController.stream;

  /// Player volume in dBFS, clamped from -96 to 0.
  Stream<double> get playerVolumeStream => _playerVolumeStreamController.stream;

  /// Recorder volume in dBFS, clamped from -96 to 0.
  Stream<double> get recorderVolumeStream => _recorderVolumeStreamController.stream;

  String? _id;
  MethodChannel? _channel;
  bool _isDisposed = false;

  RealtimeAudioState _state = const RealtimeAudioState();
  RealtimeAudioState get state => _state;

  static Future<RealtimeAudioRecordPermission> getRecordPermission() async {
    final RealtimeAudioResponseGetRecordPermission response =
        await const RealtimeAudioArguments.getRecordPermission().invoke(_staticChannel);

    return response.permission;
  }

  static Future<RealtimeAudioRecordPermission> requestRecordPermission() async {
    final RealtimeAudioResponseRequestRecordPermission response =
        await const RealtimeAudioArguments.requestRecordPermission().invoke(_staticChannel);

    return response.permission;
  }

  Future<dynamic> _handleChannel(MethodCall call) async {
    try {
      _handleChannelSafe(call);
    } catch (e, s) {
      print("$e\n\n$s"); // ignore: avoid_print
    }
  }

  Future<dynamic> _handleChannelSafe(MethodCall call) async {
    if (_isDisposed) return;

    switch (call.method) {
      case 'echo':
        if (kDebugMode) {
          print("Echo: ${call.arguments}"); // ignore: avoid_print
        }
        break;
      case 'state':
        final arguments = Map<String, dynamic>.from(call.arguments as Map);
        final newState = RealtimeAudioState.fromJson(arguments);
        if (_state != newState) {
          _state = newState;
          _stateStreamController.sink.add(newState);
        }
        break;
      case 'playerVolume':
        _playerVolumeStreamController.sink.add(call.arguments as double);
        break;
      case 'recorderVolume':
        _recorderVolumeStreamController.sink.add(call.arguments as double);
        break;
      case 'recorderData':
        _recorderStreamController.sink.add(call.arguments as Uint8List);
        break;
      case 'chunkQueued':
        handleChunkQueued(call.arguments as String);
        break;
      case 'chunkQueueStarted':
        handleChunkQueueStarted(call.arguments as String);
        break;
      case 'chunkPlayed':
        handleChunkPlayed(call.arguments as String);
        break;
      default:
        print("Unimplemented call: ${call.method} with args: ${call.arguments}."); // ignore: avoid_print
    }
  }

  //

  void handleQueueEntry(RealtimeAudioQueueEntry entry) {
    entry.map(
      chunk: (v) {
        _queuedChunks.remove(v.id);
      },
      callback: (v) {
        try {
          v.callback();
        } catch (e, s) {
          print("$e\n\n$s"); // ignore: avoid_print
        }
      },
    );
  }

  void handleChunkQueued(String id) {
    assert(_queuedChunks.contains(id), "Chunk $id not found in dart queue.");
  }

  void handleChunkQueueStarted(String id) {
    if (!_queuedChunks.contains(id)) return;

    assert(
      _queue.firstWhereOrNull((v) => v.mapOrNull(chunk: (v) => v.id == id) == true) != null,
      "Chunk $id not found in queue.",
    );
    assert(
      (() {
        final firstChunkId = _queue
            .firstWhereOrNull((v) => v.mapOrNull(chunk: (v) => v.id == id) == true) //
            ?.mapOrNull(chunk: (v) => v.id);

        return firstChunkId == id;
      })(),
      "Chunk event order seems to be wrong.",
    );

    // Handle all queued entries until the first chunk.
    while (_queue.isNotEmpty) {
      final entry = _queue.first;
      final isChunkFound = entry.mapOrNull(chunk: (_) => true) == true;

      if (isChunkFound) break;
      handleQueueEntry(entry);
      _queue.removeAt(0);
    }
  }

  void handleChunkPlayed(String id) {
    if (!_queuedChunks.contains(id)) return;

    assert(
      _queue.firstWhereOrNull((v) => v.mapOrNull(chunk: (v) => v.id == id) == true) != null,
      "Chunk $id not found in queue.",
    );
    assert(
      (() {
        final firstChunkId = _queue
            .firstWhereOrNull((v) => v.mapOrNull(chunk: (v) => v.id == id) == true) //
            ?.mapOrNull(chunk: (v) => v.id);

        return firstChunkId == id;
      })(),
      "Chunk event order seems to be wrong.",
    );

    // Handle all queued entries until the chunk after ID or the end of the queue.
    bool isTargetIdFound = false;
    bool isChunkAfterTargetFound = false;

    while (_queue.isNotEmpty && !isChunkAfterTargetFound) {
      final entry = _queue.first;

      isChunkAfterTargetFound = isTargetIdFound && entry.mapOrNull(chunk: (_) => true) == true;
      isTargetIdFound = isTargetIdFound || isChunkAfterTargetFound || entry.mapOrNull(chunk: (v) => v.id == id) == true;

      if (isChunkAfterTargetFound) break;
      handleQueueEntry(entry);
      _queue.removeAt(0);
    }
  }

  //

  Future<void> queueChunk(Uint8List data, {String? id}) {
    if (data.isEmpty) return Future.value();

    return _withInitAndLock(() async {
      if (_channel == null) return;

      final effectiveId = id ?? _uuid.v4();
      final queueEntry = RealtimeAudioQueueEntry.chunk(id: effectiveId);

      _queue.add(queueEntry);
      _queuedChunks.add(effectiveId);

      try {
        await _channel!.invokeMethod('queue', {'id': effectiveId, 'data': data});
      } catch (_) {
        _queue.removeWhere((v) => v == queueEntry);
        rethrow;
      }
    });
  }

  void queueCallback(void Function() callback) => _semaphore.withLock(() {
        final queueEntry = RealtimeAudioQueueEntry.callback(callback: callback);
        _queue.add(queueEntry);
      });

  Future<void> _withInitAndLock(Future<void> Function() fn) async {
    await _semaphore.acquire();
    try {
      await isInitialized;
    } catch (_) {} // Ignore.
    if (_isDisposed) return;
    try {
      return await fn();
    } finally {
      _semaphore.release();
    }
  }

  //

  Future<void> start() => _withInitAndLock(() async => _channel?.invokeMethod('start'));
  Future<void> pause() => _withInitAndLock(() async => _channel?.invokeMethod('pause'));
  Future<void> resume() => _withInitAndLock(() async => _channel?.invokeMethod('resume'));
  Future<void> stop() async => _withInitAndLock(() async => _channel?.invokeMethod('stop'));
  Future<void> clearQueue() => _withInitAndLock(() async => _channel?.invokeMethod('clearQueue'));

  //

  Future<void> _initialize() => _semaphore.withLock(() async {
        final RealtimeAudioResponseCreate response = await RealtimeAudioArguments.create(
          voiceProcessing: true,
          recorderSampleRate: recorderSampleRate,
          playerSampleRate: playerSampleRate,
          playerProgressInterval: playerProgressInterval,
          playerVolumeInterval: playerVolumeInterval,
          recorderChunkInterval: recorderChunkInterval,
        ).invoke(_staticChannel);

        _id = response.id;
        _channel = MethodChannel('dev.volskaya.RealtimeAudio/engines/$_id');
        _channel!.setMethodCallHandler(_handleChannel);
      });

  Future<void> dispose() => _withInitAndLock(() async {
        _channel?.setMethodCallHandler(null);
        _isDisposed = true;
        _recorderVolumeStreamController.close();
        _recorderVolumeStreamController.sink.close();
        _playerVolumeStreamController.close();
        _playerVolumeStreamController.sink.close();
        _recorderStreamController.close();
        _recorderStreamController.sink.close();
        _stateStreamController.close();
        _stateStreamController.sink.close();
        if (_id != null) await RealtimeAudioArguments.destroy(id: _id!).invoke(_staticChannel);
        _id = null;
      });
}
