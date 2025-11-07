import 'package:freezed_annotation/freezed_annotation.dart';

part 'realtime_audio_instance_response.freezed.dart';
part 'realtime_audio_instance_response.g.dart';

@freezed
abstract class RealtimeAudioInstanceResponse with _$RealtimeAudioInstanceResponse {
  const factory RealtimeAudioInstanceResponse.clearQueue({
    RealtimeAudioClearQueueChunkData? chunk,
  }) = RealtimeAudioInstanceResponseClearQueue;

  factory RealtimeAudioInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$RealtimeAudioInstanceResponseFromJson(json);
}

@freezed
abstract class RealtimeAudioClearQueueChunkData with _$RealtimeAudioClearQueueChunkData {
  RealtimeAudioClearQueueChunkData._();

  factory RealtimeAudioClearQueueChunkData({
    required String id,
    required double sampleRate,
    required int sampleTime,
    required int sampleTimeTotal,
    required int chunkSampleTime,
    required int chunkSampleTimeTotal,
  }) = _RealtimeAudioClearQueueChunkData;

  factory RealtimeAudioClearQueueChunkData.fromJson(Map<String, dynamic> json) =>
      _$RealtimeAudioClearQueueChunkDataFromJson(json);

  //

  @override
  late final chunkElapsed = Duration(milliseconds: (chunkSampleTime / sampleRate * 1000).round());

  @override
  late final elapsed = Duration(milliseconds: (sampleTime / sampleRate * 1000).round());
}
