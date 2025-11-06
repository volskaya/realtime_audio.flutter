// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_audio_instance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealtimeAudioInstanceResponseClearQueue
_$RealtimeAudioInstanceResponseClearQueueFromJson(Map json) =>
    RealtimeAudioInstanceResponseClearQueue(
      chunk: json['chunk'] == null
          ? null
          : RealtimeAudioClearQueueChunkData.fromJson(
              Map<String, dynamic>.from(json['chunk'] as Map),
            ),
    );

Map<String, dynamic> _$RealtimeAudioInstanceResponseClearQueueToJson(
  RealtimeAudioInstanceResponseClearQueue instance,
) => <String, dynamic>{'chunk': instance.chunk?.toJson()};

_RealtimeAudioClearQueueChunkData _$RealtimeAudioClearQueueChunkDataFromJson(
  Map json,
) => _RealtimeAudioClearQueueChunkData(
  id: json['id'] as String,
  sampleRate: (json['sampleRate'] as num).toDouble(),
  sampleTime: (json['sampleTime'] as num).toInt(),
  sampleTimeTotal: (json['sampleTimeTotal'] as num).toInt(),
  chunkSampleTime: (json['chunkSampleTime'] as num).toInt(),
  chunkSampleTimeTotal: (json['chunkSampleTimeTotal'] as num).toInt(),
);

Map<String, dynamic> _$RealtimeAudioClearQueueChunkDataToJson(
  _RealtimeAudioClearQueueChunkData instance,
) => <String, dynamic>{
  'id': instance.id,
  'sampleRate': instance.sampleRate,
  'sampleTime': instance.sampleTime,
  'sampleTimeTotal': instance.sampleTimeTotal,
  'chunkSampleTime': instance.chunkSampleTime,
  'chunkSampleTimeTotal': instance.chunkSampleTimeTotal,
};
