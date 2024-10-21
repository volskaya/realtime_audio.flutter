// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_audio_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealtimeAudioStateImpl _$$RealtimeAudioStateImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeAudioStateImpl(
      isPlaying: json['isPlaying'] as bool? ?? false,
      isPaused: json['isPaused'] as bool? ?? false,
      isRecording: json['isRecording'] as bool? ?? false,
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      durationTotal: (json['durationTotal'] as num?)?.toInt() ?? 0,
      chunkCount: (json['chunkCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RealtimeAudioStateImplToJson(
        _$RealtimeAudioStateImpl instance) =>
    <String, dynamic>{
      'isPlaying': instance.isPlaying,
      'isPaused': instance.isPaused,
      'isRecording': instance.isRecording,
      'duration': instance.duration,
      'durationTotal': instance.durationTotal,
      'chunkCount': instance.chunkCount,
    };
