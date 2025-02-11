// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_audio_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealtimeAudioArgumentsCreateImpl _$$RealtimeAudioArgumentsCreateImplFromJson(
        Map json) =>
    _$RealtimeAudioArgumentsCreateImpl(
      isFirstCreate: json['isFirstCreate'] as bool,
      voiceProcessing: json['voiceProcessing'] as bool? ?? true,
      backgroundEnabled: json['backgroundEnabled'] as bool? ?? false,
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
      backgroundVolume: (json['backgroundVolume'] as num?)?.toDouble() ?? 1.0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RealtimeAudioArgumentsCreateImplToJson(
        _$RealtimeAudioArgumentsCreateImpl instance) =>
    <String, dynamic>{
      'isFirstCreate': instance.isFirstCreate,
      'voiceProcessing': instance.voiceProcessing,
      'backgroundEnabled': instance.backgroundEnabled,
      'recorderEnabled': instance.recorderEnabled,
      'recorderSampleRate': instance.recorderSampleRate,
      'playerSampleRate': instance.playerSampleRate,
      'playerProgressInterval': instance.playerProgressInterval,
      'playerVolumeInterval': instance.playerVolumeInterval,
      'recorderChunkInterval': instance.recorderChunkInterval,
      'backgroundVolume': instance.backgroundVolume,
      'runtimeType': instance.$type,
    };

_$RealtimeAudioArgumentsDestroyImpl
    _$$RealtimeAudioArgumentsDestroyImplFromJson(Map json) =>
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
    _$$RealtimeAudioArgumentsGetRecordPermissionImplFromJson(Map json) =>
        _$RealtimeAudioArgumentsGetRecordPermissionImpl(
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RealtimeAudioArgumentsGetRecordPermissionImplToJson(
        _$RealtimeAudioArgumentsGetRecordPermissionImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$RealtimeAudioArgumentsRequestRecordPermissionImpl
    _$$RealtimeAudioArgumentsRequestRecordPermissionImplFromJson(Map json) =>
        _$RealtimeAudioArgumentsRequestRecordPermissionImpl(
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RealtimeAudioArgumentsRequestRecordPermissionImplToJson(
        _$RealtimeAudioArgumentsRequestRecordPermissionImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
