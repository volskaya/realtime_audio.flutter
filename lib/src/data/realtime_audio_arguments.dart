import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtime_audio/src/data/realtime_audio_response.dart';

part 'realtime_audio_arguments.freezed.dart';
part 'realtime_audio_arguments.g.dart';

@freezed
class RealtimeAudioArguments with _$RealtimeAudioArguments {
  const factory RealtimeAudioArguments.create({
    required bool isFirstCreate,
    @Default(true) bool voiceProcessing,
    @Default(false) bool backgroundEnabled,
    @Default(false) bool recorderEnabled,
    @Default(24000) int recorderSampleRate,
    @Default(24000) int playerSampleRate,
    @Default(10) int playerProgressInterval,
    @Default(40) int playerVolumeInterval,
    @Default(40) int recorderChunkInterval,
    @Default(1.0) double backgroundVolume,
  }) = _RealtimeAudioArgumentsCreate;

  const factory RealtimeAudioArguments.destroy({
    required String id,
  }) = _RealtimeAudioArgumentsDestroy;

  const factory RealtimeAudioArguments.getRecordPermission() = _RealtimeAudioArgumentsGetRecordPermission;
  const factory RealtimeAudioArguments.requestRecordPermission() = _RealtimeAudioArgumentsRequestRecordPermission;

  //

  const RealtimeAudioArguments._();
  factory RealtimeAudioArguments.fromJson(Map<String, dynamic> json) => _$RealtimeAudioArgumentsFromJson(json);

  //

  Future<T> invoke<T extends RealtimeAudioResponse>(MethodChannel channel) async {
    final json = toJson();
    final runtimeType = json.remove('runtimeType');
    final map = await channel.invokeMethod(runtimeType, json);

    return RealtimeAudioResponse.fromJson({
      ...map,
      'runtimeType': runtimeType,
    }) as T;
  }
}
