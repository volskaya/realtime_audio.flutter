// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
RealtimeAudioArguments _$RealtimeAudioArgumentsFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'create':
          return _RealtimeAudioArgumentsCreate.fromJson(
            json
          );
                case 'destroy':
          return _RealtimeAudioArgumentsDestroy.fromJson(
            json
          );
                case 'getRecordPermission':
          return _RealtimeAudioArgumentsGetRecordPermission.fromJson(
            json
          );
                case 'requestRecordPermission':
          return _RealtimeAudioArgumentsRequestRecordPermission.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'RealtimeAudioArguments',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$RealtimeAudioArguments {



  /// Serializes this RealtimeAudioArguments to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioArguments);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RealtimeAudioArguments()';
}


}

/// @nodoc
class $RealtimeAudioArgumentsCopyWith<$Res>  {
$RealtimeAudioArgumentsCopyWith(RealtimeAudioArguments _, $Res Function(RealtimeAudioArguments) __);
}


/// Adds pattern-matching-related methods to [RealtimeAudioArguments].
extension RealtimeAudioArgumentsPatterns on RealtimeAudioArguments {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RealtimeAudioArgumentsCreate value)?  create,TResult Function( _RealtimeAudioArgumentsDestroy value)?  destroy,TResult Function( _RealtimeAudioArgumentsGetRecordPermission value)?  getRecordPermission,TResult Function( _RealtimeAudioArgumentsRequestRecordPermission value)?  requestRecordPermission,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeAudioArgumentsCreate() when create != null:
return create(_that);case _RealtimeAudioArgumentsDestroy() when destroy != null:
return destroy(_that);case _RealtimeAudioArgumentsGetRecordPermission() when getRecordPermission != null:
return getRecordPermission(_that);case _RealtimeAudioArgumentsRequestRecordPermission() when requestRecordPermission != null:
return requestRecordPermission(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RealtimeAudioArgumentsCreate value)  create,required TResult Function( _RealtimeAudioArgumentsDestroy value)  destroy,required TResult Function( _RealtimeAudioArgumentsGetRecordPermission value)  getRecordPermission,required TResult Function( _RealtimeAudioArgumentsRequestRecordPermission value)  requestRecordPermission,}){
final _that = this;
switch (_that) {
case _RealtimeAudioArgumentsCreate():
return create(_that);case _RealtimeAudioArgumentsDestroy():
return destroy(_that);case _RealtimeAudioArgumentsGetRecordPermission():
return getRecordPermission(_that);case _RealtimeAudioArgumentsRequestRecordPermission():
return requestRecordPermission(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RealtimeAudioArgumentsCreate value)?  create,TResult? Function( _RealtimeAudioArgumentsDestroy value)?  destroy,TResult? Function( _RealtimeAudioArgumentsGetRecordPermission value)?  getRecordPermission,TResult? Function( _RealtimeAudioArgumentsRequestRecordPermission value)?  requestRecordPermission,}){
final _that = this;
switch (_that) {
case _RealtimeAudioArgumentsCreate() when create != null:
return create(_that);case _RealtimeAudioArgumentsDestroy() when destroy != null:
return destroy(_that);case _RealtimeAudioArgumentsGetRecordPermission() when getRecordPermission != null:
return getRecordPermission(_that);case _RealtimeAudioArgumentsRequestRecordPermission() when requestRecordPermission != null:
return requestRecordPermission(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isFirstCreate,  bool voiceProcessing,  bool backgroundEnabled,  bool recorderEnabled,  int recorderSampleRate,  int playerSampleRate,  int playerProgressInterval,  int playerVolumeInterval,  int recorderChunkInterval,  double backgroundVolume)?  create,TResult Function( String id)?  destroy,TResult Function()?  getRecordPermission,TResult Function()?  requestRecordPermission,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeAudioArgumentsCreate() when create != null:
return create(_that.isFirstCreate,_that.voiceProcessing,_that.backgroundEnabled,_that.recorderEnabled,_that.recorderSampleRate,_that.playerSampleRate,_that.playerProgressInterval,_that.playerVolumeInterval,_that.recorderChunkInterval,_that.backgroundVolume);case _RealtimeAudioArgumentsDestroy() when destroy != null:
return destroy(_that.id);case _RealtimeAudioArgumentsGetRecordPermission() when getRecordPermission != null:
return getRecordPermission();case _RealtimeAudioArgumentsRequestRecordPermission() when requestRecordPermission != null:
return requestRecordPermission();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isFirstCreate,  bool voiceProcessing,  bool backgroundEnabled,  bool recorderEnabled,  int recorderSampleRate,  int playerSampleRate,  int playerProgressInterval,  int playerVolumeInterval,  int recorderChunkInterval,  double backgroundVolume)  create,required TResult Function( String id)  destroy,required TResult Function()  getRecordPermission,required TResult Function()  requestRecordPermission,}) {final _that = this;
switch (_that) {
case _RealtimeAudioArgumentsCreate():
return create(_that.isFirstCreate,_that.voiceProcessing,_that.backgroundEnabled,_that.recorderEnabled,_that.recorderSampleRate,_that.playerSampleRate,_that.playerProgressInterval,_that.playerVolumeInterval,_that.recorderChunkInterval,_that.backgroundVolume);case _RealtimeAudioArgumentsDestroy():
return destroy(_that.id);case _RealtimeAudioArgumentsGetRecordPermission():
return getRecordPermission();case _RealtimeAudioArgumentsRequestRecordPermission():
return requestRecordPermission();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isFirstCreate,  bool voiceProcessing,  bool backgroundEnabled,  bool recorderEnabled,  int recorderSampleRate,  int playerSampleRate,  int playerProgressInterval,  int playerVolumeInterval,  int recorderChunkInterval,  double backgroundVolume)?  create,TResult? Function( String id)?  destroy,TResult? Function()?  getRecordPermission,TResult? Function()?  requestRecordPermission,}) {final _that = this;
switch (_that) {
case _RealtimeAudioArgumentsCreate() when create != null:
return create(_that.isFirstCreate,_that.voiceProcessing,_that.backgroundEnabled,_that.recorderEnabled,_that.recorderSampleRate,_that.playerSampleRate,_that.playerProgressInterval,_that.playerVolumeInterval,_that.recorderChunkInterval,_that.backgroundVolume);case _RealtimeAudioArgumentsDestroy() when destroy != null:
return destroy(_that.id);case _RealtimeAudioArgumentsGetRecordPermission() when getRecordPermission != null:
return getRecordPermission();case _RealtimeAudioArgumentsRequestRecordPermission() when requestRecordPermission != null:
return requestRecordPermission();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RealtimeAudioArgumentsCreate extends RealtimeAudioArguments {
  const _RealtimeAudioArgumentsCreate({required this.isFirstCreate, this.voiceProcessing = true, this.backgroundEnabled = false, this.recorderEnabled = false, this.recorderSampleRate = 24000, this.playerSampleRate = 24000, this.playerProgressInterval = 10, this.playerVolumeInterval = 40, this.recorderChunkInterval = 40, this.backgroundVolume = 1.0, final  String? $type}): $type = $type ?? 'create',super._();
  factory _RealtimeAudioArgumentsCreate.fromJson(Map<String, dynamic> json) => _$RealtimeAudioArgumentsCreateFromJson(json);

 final  bool isFirstCreate;
@JsonKey() final  bool voiceProcessing;
@JsonKey() final  bool backgroundEnabled;
@JsonKey() final  bool recorderEnabled;
@JsonKey() final  int recorderSampleRate;
@JsonKey() final  int playerSampleRate;
@JsonKey() final  int playerProgressInterval;
@JsonKey() final  int playerVolumeInterval;
@JsonKey() final  int recorderChunkInterval;
@JsonKey() final  double backgroundVolume;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of RealtimeAudioArguments
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeAudioArgumentsCreateCopyWith<_RealtimeAudioArgumentsCreate> get copyWith => __$RealtimeAudioArgumentsCreateCopyWithImpl<_RealtimeAudioArgumentsCreate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioArgumentsCreateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeAudioArgumentsCreate&&(identical(other.isFirstCreate, isFirstCreate) || other.isFirstCreate == isFirstCreate)&&(identical(other.voiceProcessing, voiceProcessing) || other.voiceProcessing == voiceProcessing)&&(identical(other.backgroundEnabled, backgroundEnabled) || other.backgroundEnabled == backgroundEnabled)&&(identical(other.recorderEnabled, recorderEnabled) || other.recorderEnabled == recorderEnabled)&&(identical(other.recorderSampleRate, recorderSampleRate) || other.recorderSampleRate == recorderSampleRate)&&(identical(other.playerSampleRate, playerSampleRate) || other.playerSampleRate == playerSampleRate)&&(identical(other.playerProgressInterval, playerProgressInterval) || other.playerProgressInterval == playerProgressInterval)&&(identical(other.playerVolumeInterval, playerVolumeInterval) || other.playerVolumeInterval == playerVolumeInterval)&&(identical(other.recorderChunkInterval, recorderChunkInterval) || other.recorderChunkInterval == recorderChunkInterval)&&(identical(other.backgroundVolume, backgroundVolume) || other.backgroundVolume == backgroundVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFirstCreate,voiceProcessing,backgroundEnabled,recorderEnabled,recorderSampleRate,playerSampleRate,playerProgressInterval,playerVolumeInterval,recorderChunkInterval,backgroundVolume);

@override
String toString() {
  return 'RealtimeAudioArguments.create(isFirstCreate: $isFirstCreate, voiceProcessing: $voiceProcessing, backgroundEnabled: $backgroundEnabled, recorderEnabled: $recorderEnabled, recorderSampleRate: $recorderSampleRate, playerSampleRate: $playerSampleRate, playerProgressInterval: $playerProgressInterval, playerVolumeInterval: $playerVolumeInterval, recorderChunkInterval: $recorderChunkInterval, backgroundVolume: $backgroundVolume)';
}


}

/// @nodoc
abstract mixin class _$RealtimeAudioArgumentsCreateCopyWith<$Res> implements $RealtimeAudioArgumentsCopyWith<$Res> {
  factory _$RealtimeAudioArgumentsCreateCopyWith(_RealtimeAudioArgumentsCreate value, $Res Function(_RealtimeAudioArgumentsCreate) _then) = __$RealtimeAudioArgumentsCreateCopyWithImpl;
@useResult
$Res call({
 bool isFirstCreate, bool voiceProcessing, bool backgroundEnabled, bool recorderEnabled, int recorderSampleRate, int playerSampleRate, int playerProgressInterval, int playerVolumeInterval, int recorderChunkInterval, double backgroundVolume
});




}
/// @nodoc
class __$RealtimeAudioArgumentsCreateCopyWithImpl<$Res>
    implements _$RealtimeAudioArgumentsCreateCopyWith<$Res> {
  __$RealtimeAudioArgumentsCreateCopyWithImpl(this._self, this._then);

  final _RealtimeAudioArgumentsCreate _self;
  final $Res Function(_RealtimeAudioArgumentsCreate) _then;

/// Create a copy of RealtimeAudioArguments
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isFirstCreate = null,Object? voiceProcessing = null,Object? backgroundEnabled = null,Object? recorderEnabled = null,Object? recorderSampleRate = null,Object? playerSampleRate = null,Object? playerProgressInterval = null,Object? playerVolumeInterval = null,Object? recorderChunkInterval = null,Object? backgroundVolume = null,}) {
  return _then(_RealtimeAudioArgumentsCreate(
isFirstCreate: null == isFirstCreate ? _self.isFirstCreate : isFirstCreate // ignore: cast_nullable_to_non_nullable
as bool,voiceProcessing: null == voiceProcessing ? _self.voiceProcessing : voiceProcessing // ignore: cast_nullable_to_non_nullable
as bool,backgroundEnabled: null == backgroundEnabled ? _self.backgroundEnabled : backgroundEnabled // ignore: cast_nullable_to_non_nullable
as bool,recorderEnabled: null == recorderEnabled ? _self.recorderEnabled : recorderEnabled // ignore: cast_nullable_to_non_nullable
as bool,recorderSampleRate: null == recorderSampleRate ? _self.recorderSampleRate : recorderSampleRate // ignore: cast_nullable_to_non_nullable
as int,playerSampleRate: null == playerSampleRate ? _self.playerSampleRate : playerSampleRate // ignore: cast_nullable_to_non_nullable
as int,playerProgressInterval: null == playerProgressInterval ? _self.playerProgressInterval : playerProgressInterval // ignore: cast_nullable_to_non_nullable
as int,playerVolumeInterval: null == playerVolumeInterval ? _self.playerVolumeInterval : playerVolumeInterval // ignore: cast_nullable_to_non_nullable
as int,recorderChunkInterval: null == recorderChunkInterval ? _self.recorderChunkInterval : recorderChunkInterval // ignore: cast_nullable_to_non_nullable
as int,backgroundVolume: null == backgroundVolume ? _self.backgroundVolume : backgroundVolume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _RealtimeAudioArgumentsDestroy extends RealtimeAudioArguments {
  const _RealtimeAudioArgumentsDestroy({required this.id, final  String? $type}): $type = $type ?? 'destroy',super._();
  factory _RealtimeAudioArgumentsDestroy.fromJson(Map<String, dynamic> json) => _$RealtimeAudioArgumentsDestroyFromJson(json);

 final  String id;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of RealtimeAudioArguments
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeAudioArgumentsDestroyCopyWith<_RealtimeAudioArgumentsDestroy> get copyWith => __$RealtimeAudioArgumentsDestroyCopyWithImpl<_RealtimeAudioArgumentsDestroy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioArgumentsDestroyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeAudioArgumentsDestroy&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'RealtimeAudioArguments.destroy(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RealtimeAudioArgumentsDestroyCopyWith<$Res> implements $RealtimeAudioArgumentsCopyWith<$Res> {
  factory _$RealtimeAudioArgumentsDestroyCopyWith(_RealtimeAudioArgumentsDestroy value, $Res Function(_RealtimeAudioArgumentsDestroy) _then) = __$RealtimeAudioArgumentsDestroyCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$RealtimeAudioArgumentsDestroyCopyWithImpl<$Res>
    implements _$RealtimeAudioArgumentsDestroyCopyWith<$Res> {
  __$RealtimeAudioArgumentsDestroyCopyWithImpl(this._self, this._then);

  final _RealtimeAudioArgumentsDestroy _self;
  final $Res Function(_RealtimeAudioArgumentsDestroy) _then;

/// Create a copy of RealtimeAudioArguments
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_RealtimeAudioArgumentsDestroy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _RealtimeAudioArgumentsGetRecordPermission extends RealtimeAudioArguments {
  const _RealtimeAudioArgumentsGetRecordPermission({final  String? $type}): $type = $type ?? 'getRecordPermission',super._();
  factory _RealtimeAudioArgumentsGetRecordPermission.fromJson(Map<String, dynamic> json) => _$RealtimeAudioArgumentsGetRecordPermissionFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioArgumentsGetRecordPermissionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeAudioArgumentsGetRecordPermission);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RealtimeAudioArguments.getRecordPermission()';
}


}




/// @nodoc
@JsonSerializable()

class _RealtimeAudioArgumentsRequestRecordPermission extends RealtimeAudioArguments {
  const _RealtimeAudioArgumentsRequestRecordPermission({final  String? $type}): $type = $type ?? 'requestRecordPermission',super._();
  factory _RealtimeAudioArgumentsRequestRecordPermission.fromJson(Map<String, dynamic> json) => _$RealtimeAudioArgumentsRequestRecordPermissionFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioArgumentsRequestRecordPermissionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeAudioArgumentsRequestRecordPermission);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RealtimeAudioArguments.requestRecordPermission()';
}


}




// dart format on
