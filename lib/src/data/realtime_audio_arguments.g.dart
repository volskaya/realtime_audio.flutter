// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_audio_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealtimeAudioArgumentsCreateImpl _$$RealtimeAudioArgumentsCreateImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeAudioArgumentsCreateImpl(
      voiceProcessing: json['voiceProcessing'] as bool? ?? true,
      recorderEnabled: json['recorderEnabled'] as bool? ?? false,
      recorderSampleRate:
          (json['recorderSampleRate'] as num?)?.toInt() ?? 24000,
      playerSampleRate: (json['playerSampleRate'] as num?)?.toInt() ?? 24000,
      playerProgressInterval:
          (json['playerProgressInterval'] as num?)?.toInt() ?? 10,
      playerVolumeInterval:
          (json['playerVolumeInterval'] as num?)?.toInt() ?? 40,
      recorderChunkInterval:
          (json['recorderChunkInterval'] as num?)?.toInt() ?? 40,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RealtimeAudioArgumentsCreateImplToJson(
        _$RealtimeAudioArgumentsCreateImpl instance) =>
    <String, dynamic>{
      'voiceProcessing': instance.voiceProcessing,
      'recorderEnabled': instance.recorderEnabled,
      'recorderSampleRate': instance.recorderSampleRate,
      'playerSampleRate': instance.playerSampleRate,
      'playerProgressInterval': instance.playerProgressInterval,
      'playerVolumeInterval': instance.playerVolumeInterval,
      'recorderChunkInterval': instance.recorderChunkInterval,
      'runtimeType': instance.$type,
    };

_$RealtimeAudioArgumentsDestroyImpl
    _$$RealtimeAudioArgumentsDestroyImplFromJson(Map<String, dynamic> json) =>
        _$RealtimeAudioArgumentsDestroyImpl(
          id: json['id'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RealtimeAudioArgumentsDestroyImplToJson(
        _$RealtimeAudioArgumentsDestroyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'runtimeType': instance.$type,
    };

_$RealtimeAudioArgumentsGetRecordPermissionImpl
    _$$RealtimeAudioArgumentsGetRecordPermissionImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeAudioArgumentsGetRecordPermissionImpl(
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RealtimeAudioArgumentsGetRecordPermissionImplToJson(
        _$RealtimeAudioArgumentsGetRecordPermissionImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$RealtimeAudioArgumentsRequestRecordPermissionImpl
    _$$RealtimeAudioArgumentsRequestRecordPermissionImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeAudioArgumentsRequestRecordPermissionImpl(
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RealtimeAudioArgumentsRequestRecordPermissionImplToJson(
        _$RealtimeAudioArgumentsRequestRecordPermissionImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
