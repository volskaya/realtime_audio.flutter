// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_audio_instance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealtimeAudioInstanceResponseClearQueueImpl
    _$$RealtimeAudioInstanceResponseClearQueueImplFromJson(Map json) =>
        _$RealtimeAudioInstanceResponseClearQueueImpl(
          chunk: json['chunk'] == null
              ? null
              : RealtimeAudioClearQueueChunkData.fromJson(
                  Map<String, dynamic>.from(json['chunk'] as Map)),
        );

Map<String, dynamic> _$$RealtimeAudioInstanceResponseClearQueueImplToJson(
        _$RealtimeAudioInstanceResponseClearQueueImpl instance) =>
    <String, dynamic>{
      'chunk': instance.chunk?.toJson(),
    };

_$RealtimeAudioClearQueueChunkDataImpl
    _$$RealtimeAudioClearQueueChunkDataImplFromJson(Map json) =>
        _$RealtimeAudioClearQueueChunkDataImpl(
          id: json['id'] as String,
          sampleRate: (json['sampleRate'] as num).toDouble(),
          sampleTime: (json['sampleTime'] as num).toInt(),
          sampleTimeTotal: (json['sampleTimeTotal'] as num).toInt(),
          chunkSampleTime: (json['chunkSampleTime'] as num).toInt(),
          chunkSampleTimeTotal: (json['chunkSampleTimeTotal'] as num).toInt(),
        );

Map<String, dynamic> _$$RealtimeAudioClearQueueChunkDataImplToJson(
        _$RealtimeAudioClearQueueChunkDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sampleRate': instance.sampleRate,
      'sampleTime': instance.sampleTime,
      'sampleTimeTotal': instance.sampleTimeTotal,
      'chunkSampleTime': instance.chunkSampleTime,
      'chunkSampleTimeTotal': instance.chunkSampleTimeTotal,
    };
