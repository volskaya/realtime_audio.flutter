// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
RealtimeAudioResponse _$RealtimeAudioResponseFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'create':
          return RealtimeAudioResponseCreate.fromJson(
            json
          );
                case 'destroy':
          return RealtimeAudioResponseDestroy.fromJson(
            json
          );
                case 'getRecordPermission':
          return RealtimeAudioResponseGetRecordPermission.fromJson(
            json
          );
                case 'requestRecordPermission':
          return RealtimeAudioResponseRequestRecordPermission.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'RealtimeAudioResponse',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$RealtimeAudioResponse {



  /// Serializes this RealtimeAudioResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioResponse);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RealtimeAudioResponse()';
}


}

/// @nodoc
class $RealtimeAudioResponseCopyWith<$Res>  {
$RealtimeAudioResponseCopyWith(RealtimeAudioResponse _, $Res Function(RealtimeAudioResponse) __);
}


/// Adds pattern-matching-related methods to [RealtimeAudioResponse].
extension RealtimeAudioResponsePatterns on RealtimeAudioResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RealtimeAudioResponseCreate value)?  create,TResult Function( RealtimeAudioResponseDestroy value)?  destroy,TResult Function( RealtimeAudioResponseGetRecordPermission value)?  getRecordPermission,TResult Function( RealtimeAudioResponseRequestRecordPermission value)?  requestRecordPermission,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RealtimeAudioResponseCreate() when create != null:
return create(_that);case RealtimeAudioResponseDestroy() when destroy != null:
return destroy(_that);case RealtimeAudioResponseGetRecordPermission() when getRecordPermission != null:
return getRecordPermission(_that);case RealtimeAudioResponseRequestRecordPermission() when requestRecordPermission != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RealtimeAudioResponseCreate value)  create,required TResult Function( RealtimeAudioResponseDestroy value)  destroy,required TResult Function( RealtimeAudioResponseGetRecordPermission value)  getRecordPermission,required TResult Function( RealtimeAudioResponseRequestRecordPermission value)  requestRecordPermission,}){
final _that = this;
switch (_that) {
case RealtimeAudioResponseCreate():
return create(_that);case RealtimeAudioResponseDestroy():
return destroy(_that);case RealtimeAudioResponseGetRecordPermission():
return getRecordPermission(_that);case RealtimeAudioResponseRequestRecordPermission():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RealtimeAudioResponseCreate value)?  create,TResult? Function( RealtimeAudioResponseDestroy value)?  destroy,TResult? Function( RealtimeAudioResponseGetRecordPermission value)?  getRecordPermission,TResult? Function( RealtimeAudioResponseRequestRecordPermission value)?  requestRecordPermission,}){
final _that = this;
switch (_that) {
case RealtimeAudioResponseCreate() when create != null:
return create(_that);case RealtimeAudioResponseDestroy() when destroy != null:
return destroy(_that);case RealtimeAudioResponseGetRecordPermission() when getRecordPermission != null:
return getRecordPermission(_that);case RealtimeAudioResponseRequestRecordPermission() when requestRecordPermission != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id)?  create,TResult Function()?  destroy,TResult Function( RealtimeAudioRecordPermission permission)?  getRecordPermission,TResult Function( RealtimeAudioRecordPermission permission)?  requestRecordPermission,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RealtimeAudioResponseCreate() when create != null:
return create(_that.id);case RealtimeAudioResponseDestroy() when destroy != null:
return destroy();case RealtimeAudioResponseGetRecordPermission() when getRecordPermission != null:
return getRecordPermission(_that.permission);case RealtimeAudioResponseRequestRecordPermission() when requestRecordPermission != null:
return requestRecordPermission(_that.permission);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id)  create,required TResult Function()  destroy,required TResult Function( RealtimeAudioRecordPermission permission)  getRecordPermission,required TResult Function( RealtimeAudioRecordPermission permission)  requestRecordPermission,}) {final _that = this;
switch (_that) {
case RealtimeAudioResponseCreate():
return create(_that.id);case RealtimeAudioResponseDestroy():
return destroy();case RealtimeAudioResponseGetRecordPermission():
return getRecordPermission(_that.permission);case RealtimeAudioResponseRequestRecordPermission():
return requestRecordPermission(_that.permission);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id)?  create,TResult? Function()?  destroy,TResult? Function( RealtimeAudioRecordPermission permission)?  getRecordPermission,TResult? Function( RealtimeAudioRecordPermission permission)?  requestRecordPermission,}) {final _that = this;
switch (_that) {
case RealtimeAudioResponseCreate() when create != null:
return create(_that.id);case RealtimeAudioResponseDestroy() when destroy != null:
return destroy();case RealtimeAudioResponseGetRecordPermission() when getRecordPermission != null:
return getRecordPermission(_that.permission);case RealtimeAudioResponseRequestRecordPermission() when requestRecordPermission != null:
return requestRecordPermission(_that.permission);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RealtimeAudioResponseCreate implements RealtimeAudioResponse {
  const RealtimeAudioResponseCreate({required this.id, final  String? $type}): $type = $type ?? 'create';
  factory RealtimeAudioResponseCreate.fromJson(Map<String, dynamic> json) => _$RealtimeAudioResponseCreateFromJson(json);

 final  String id;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of RealtimeAudioResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeAudioResponseCreateCopyWith<RealtimeAudioResponseCreate> get copyWith => _$RealtimeAudioResponseCreateCopyWithImpl<RealtimeAudioResponseCreate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioResponseCreateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioResponseCreate&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'RealtimeAudioResponse.create(id: $id)';
}


}

/// @nodoc
abstract mixin class $RealtimeAudioResponseCreateCopyWith<$Res> implements $RealtimeAudioResponseCopyWith<$Res> {
  factory $RealtimeAudioResponseCreateCopyWith(RealtimeAudioResponseCreate value, $Res Function(RealtimeAudioResponseCreate) _then) = _$RealtimeAudioResponseCreateCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$RealtimeAudioResponseCreateCopyWithImpl<$Res>
    implements $RealtimeAudioResponseCreateCopyWith<$Res> {
  _$RealtimeAudioResponseCreateCopyWithImpl(this._self, this._then);

  final RealtimeAudioResponseCreate _self;
  final $Res Function(RealtimeAudioResponseCreate) _then;

/// Create a copy of RealtimeAudioResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(RealtimeAudioResponseCreate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class RealtimeAudioResponseDestroy implements RealtimeAudioResponse {
  const RealtimeAudioResponseDestroy({final  String? $type}): $type = $type ?? 'destroy';
  factory RealtimeAudioResponseDestroy.fromJson(Map<String, dynamic> json) => _$RealtimeAudioResponseDestroyFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioResponseDestroyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioResponseDestroy);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RealtimeAudioResponse.destroy()';
}


}




/// @nodoc
@JsonSerializable()

class RealtimeAudioResponseGetRecordPermission implements RealtimeAudioResponse {
  const RealtimeAudioResponseGetRecordPermission({required this.permission, final  String? $type}): $type = $type ?? 'getRecordPermission';
  factory RealtimeAudioResponseGetRecordPermission.fromJson(Map<String, dynamic> json) => _$RealtimeAudioResponseGetRecordPermissionFromJson(json);

 final  RealtimeAudioRecordPermission permission;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of RealtimeAudioResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeAudioResponseGetRecordPermissionCopyWith<RealtimeAudioResponseGetRecordPermission> get copyWith => _$RealtimeAudioResponseGetRecordPermissionCopyWithImpl<RealtimeAudioResponseGetRecordPermission>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioResponseGetRecordPermissionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioResponseGetRecordPermission&&(identical(other.permission, permission) || other.permission == permission));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,permission);

@override
String toString() {
  return 'RealtimeAudioResponse.getRecordPermission(permission: $permission)';
}


}

/// @nodoc
abstract mixin class $RealtimeAudioResponseGetRecordPermissionCopyWith<$Res> implements $RealtimeAudioResponseCopyWith<$Res> {
  factory $RealtimeAudioResponseGetRecordPermissionCopyWith(RealtimeAudioResponseGetRecordPermission value, $Res Function(RealtimeAudioResponseGetRecordPermission) _then) = _$RealtimeAudioResponseGetRecordPermissionCopyWithImpl;
@useResult
$Res call({
 RealtimeAudioRecordPermission permission
});




}
/// @nodoc
class _$RealtimeAudioResponseGetRecordPermissionCopyWithImpl<$Res>
    implements $RealtimeAudioResponseGetRecordPermissionCopyWith<$Res> {
  _$RealtimeAudioResponseGetRecordPermissionCopyWithImpl(this._self, this._then);

  final RealtimeAudioResponseGetRecordPermission _self;
  final $Res Function(RealtimeAudioResponseGetRecordPermission) _then;

/// Create a copy of RealtimeAudioResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permission = null,}) {
  return _then(RealtimeAudioResponseGetRecordPermission(
permission: null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as RealtimeAudioRecordPermission,
  ));
}


}

/// @nodoc
@JsonSerializable()

class RealtimeAudioResponseRequestRecordPermission implements RealtimeAudioResponse {
  const RealtimeAudioResponseRequestRecordPermission({required this.permission, final  String? $type}): $type = $type ?? 'requestRecordPermission';
  factory RealtimeAudioResponseRequestRecordPermission.fromJson(Map<String, dynamic> json) => _$RealtimeAudioResponseRequestRecordPermissionFromJson(json);

 final  RealtimeAudioRecordPermission permission;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of RealtimeAudioResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeAudioResponseRequestRecordPermissionCopyWith<RealtimeAudioResponseRequestRecordPermission> get copyWith => _$RealtimeAudioResponseRequestRecordPermissionCopyWithImpl<RealtimeAudioResponseRequestRecordPermission>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioResponseRequestRecordPermissionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioResponseRequestRecordPermission&&(identical(other.permission, permission) || other.permission == permission));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,permission);

@override
String toString() {
  return 'RealtimeAudioResponse.requestRecordPermission(permission: $permission)';
}


}

/// @nodoc
abstract mixin class $RealtimeAudioResponseRequestRecordPermissionCopyWith<$Res> implements $RealtimeAudioResponseCopyWith<$Res> {
  factory $RealtimeAudioResponseRequestRecordPermissionCopyWith(RealtimeAudioResponseRequestRecordPermission value, $Res Function(RealtimeAudioResponseRequestRecordPermission) _then) = _$RealtimeAudioResponseRequestRecordPermissionCopyWithImpl;
@useResult
$Res call({
 RealtimeAudioRecordPermission permission
});




}
/// @nodoc
class _$RealtimeAudioResponseRequestRecordPermissionCopyWithImpl<$Res>
    implements $RealtimeAudioResponseRequestRecordPermissionCopyWith<$Res> {
  _$RealtimeAudioResponseRequestRecordPermissionCopyWithImpl(this._self, this._then);

  final RealtimeAudioResponseRequestRecordPermission _self;
  final $Res Function(RealtimeAudioResponseRequestRecordPermission) _then;

/// Create a copy of RealtimeAudioResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permission = null,}) {
  return _then(RealtimeAudioResponseRequestRecordPermission(
permission: null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as RealtimeAudioRecordPermission,
  ));
}


}

// dart format on
