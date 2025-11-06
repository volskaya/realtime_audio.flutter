// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_audio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealtimeAudioResponseCreate _$RealtimeAudioResponseCreateFromJson(Map json) =>
    RealtimeAudioResponseCreate(
      id: json['id'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RealtimeAudioResponseCreateToJson(
  RealtimeAudioResponseCreate instance,
) => <String, dynamic>{'id': instance.id, 'runtimeType': instance.$type};

RealtimeAudioResponseDestroy _$RealtimeAudioResponseDestroyFromJson(Map json) =>
    RealtimeAudioResponseDestroy($type: json['runtimeType'] as String?);

Map<String, dynamic> _$RealtimeAudioResponseDestroyToJson(
  RealtimeAudioResponseDestroy instance,
) => <String, dynamic>{'runtimeType': instance.$type};

RealtimeAudioResponseGetRecordPermission
_$RealtimeAudioResponseGetRecordPermissionFromJson(Map json) =>
    RealtimeAudioResponseGetRecordPermission(
      permission: $enumDecode(
        _$RealtimeAudioRecordPermissionEnumMap,
        json['permission'],
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RealtimeAudioResponseGetRecordPermissionToJson(
  RealtimeAudioResponseGetRecordPermission instance,
) => <String, dynamic>{
  'permission': _$RealtimeAudioRecordPermissionEnumMap[instance.permission]!,
  'runtimeType': instance.$type,
};

const _$RealtimeAudioRecordPermissionEnumMap = {
  RealtimeAudioRecordPermission.undetermined: 'undetermined',
  RealtimeAudioRecordPermission.denied: 'denied',
  RealtimeAudioRecordPermission.granted: 'granted',
};

RealtimeAudioResponseRequestRecordPermission
_$RealtimeAudioResponseRequestRecordPermissionFromJson(Map json) =>
    RealtimeAudioResponseRequestRecordPermission(
      permission: $enumDecode(
        _$RealtimeAudioRecordPermissionEnumMap,
        json['permission'],
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RealtimeAudioResponseRequestRecordPermissionToJson(
  RealtimeAudioResponseRequestRecordPermission instance,
) => <String, dynamic>{
  'permission': _$RealtimeAudioRecordPermissionEnumMap[instance.permission]!,
  'runtimeType': instance.$type,
};
