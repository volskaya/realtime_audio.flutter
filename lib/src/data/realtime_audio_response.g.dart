// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_audio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealtimeAudioResponseCreateImpl _$$RealtimeAudioResponseCreateImplFromJson(
        Map json) =>
    _$RealtimeAudioResponseCreateImpl(
      id: json['id'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RealtimeAudioResponseCreateImplToJson(
        _$RealtimeAudioResponseCreateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'runtimeType': instance.$type,
    };

_$RealtimeAudioResponseDestroyImpl _$$RealtimeAudioResponseDestroyImplFromJson(
        Map json) =>
    _$RealtimeAudioResponseDestroyImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RealtimeAudioResponseDestroyImplToJson(
        _$RealtimeAudioResponseDestroyImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$RealtimeAudioResponseGetRecordPermissionImpl
    _$$RealtimeAudioResponseGetRecordPermissionImplFromJson(Map json) =>
        _$RealtimeAudioResponseGetRecordPermissionImpl(
          permission: $enumDecode(
              _$RealtimeAudioRecordPermissionEnumMap, json['permission']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RealtimeAudioResponseGetRecordPermissionImplToJson(
        _$RealtimeAudioResponseGetRecordPermissionImpl instance) =>
    <String, dynamic>{
      'permission':
          _$RealtimeAudioRecordPermissionEnumMap[instance.permission]!,
      'runtimeType': instance.$type,
    };

const _$RealtimeAudioRecordPermissionEnumMap = {
  RealtimeAudioRecordPermission.undetermined: 'undetermined',
  RealtimeAudioRecordPermission.denied: 'denied',
  RealtimeAudioRecordPermission.granted: 'granted',
};

_$RealtimeAudioResponseRequestRecordPermissionImpl
    _$$RealtimeAudioResponseRequestRecordPermissionImplFromJson(Map json) =>
        _$RealtimeAudioResponseRequestRecordPermissionImpl(
          permission: $enumDecode(
              _$RealtimeAudioRecordPermissionEnumMap, json['permission']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RealtimeAudioResponseRequestRecordPermissionImplToJson(
        _$RealtimeAudioResponseRequestRecordPermissionImpl instance) =>
    <String, dynamic>{
      'permission':
          _$RealtimeAudioRecordPermissionEnumMap[instance.permission]!,
      'runtimeType': instance.$type,
    };
