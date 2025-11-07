// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_audio_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RealtimeAudioArgumentsCreate _$RealtimeAudioArgumentsCreateFromJson(
  Map json,
) => _RealtimeAudioArgumentsCreate(
  isFirstCreate: json['isFirstCreate'] as bool,
  voiceProcessing: json['voiceProcessing'] as bool? ?? true,
  backgroundEnabled: json['backgroundEnabled'] as bool? ?? false,
  recorderEnabled: json['recorderEnabled'] as bool? ?? false,
  recorderSampleRate: (json['recorderSampleRate'] as num?)?.toInt() ?? 24000,
  playerSampleRate: (json['playerSampleRate'] as num?)?.toInt() ?? 24000,
  playerProgressInterval:
      (json['playerProgressInterval'] as num?)?.toInt() ?? 10,
  playerVolumeInterval: (json['playerVolumeInterval'] as num?)?.toInt() ?? 40,
  recorderChunkInterval: (json['recorderChunkInterval'] as num?)?.toInt() ?? 40,
  backgroundVolume: (json['backgroundVolume'] as num?)?.toDouble() ?? 1.0,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$RealtimeAudioArgumentsCreateToJson(
  _RealtimeAudioArgumentsCreate instance,
) => <String, dynamic>{
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

_RealtimeAudioArgumentsDestroy _$RealtimeAudioArgumentsDestroyFromJson(
  Map json,
) => _RealtimeAudioArgumentsDestroy(
  id: json['id'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$RealtimeAudioArgumentsDestroyToJson(
  _RealtimeAudioArgumentsDestroy instance,
) => <String, dynamic>{'id': instance.id, 'runtimeType': instance.$type};

_RealtimeAudioArgumentsGetRecordPermission
_$RealtimeAudioArgumentsGetRecordPermissionFromJson(Map json) =>
    _RealtimeAudioArgumentsGetRecordPermission(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RealtimeAudioArgumentsGetRecordPermissionToJson(
  _RealtimeAudioArgumentsGetRecordPermission instance,
) => <String, dynamic>{'runtimeType': instance.$type};

_RealtimeAudioArgumentsRequestRecordPermission
_$RealtimeAudioArgumentsRequestRecordPermissionFromJson(Map json) =>
    _RealtimeAudioArgumentsRequestRecordPermission(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RealtimeAudioArgumentsRequestRecordPermissionToJson(
  _RealtimeAudioArgumentsRequestRecordPermission instance,
) => <String, dynamic>{'runtimeType': instance.$type};
