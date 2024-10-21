// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RealtimeAudioResponse _$RealtimeAudioResponseFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'create':
      return RealtimeAudioResponseCreate.fromJson(json);
    case 'destroy':
      return RealtimeAudioResponseDestroy.fromJson(json);
    case 'getRecordPermission':
      return RealtimeAudioResponseGetRecordPermission.fromJson(json);
    case 'requestRecordPermission':
      return RealtimeAudioResponseRequestRecordPermission.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'RealtimeAudioResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RealtimeAudioResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) create,
    required TResult Function() destroy,
    required TResult Function(RealtimeAudioRecordPermission permission)
        getRecordPermission,
    required TResult Function(RealtimeAudioRecordPermission permission)
        requestRecordPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? create,
    TResult? Function()? destroy,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? create,
    TResult Function()? destroy,
    TResult Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeAudioResponseCreate value) create,
    required TResult Function(RealtimeAudioResponseDestroy value) destroy,
    required TResult Function(RealtimeAudioResponseGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            RealtimeAudioResponseRequestRecordPermission value)
        requestRecordPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeAudioResponseCreate value)? create,
    TResult? Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult? Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeAudioResponseCreate value)? create,
    TResult Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this RealtimeAudioResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeAudioResponseCopyWith<$Res> {
  factory $RealtimeAudioResponseCopyWith(RealtimeAudioResponse value,
          $Res Function(RealtimeAudioResponse) then) =
      _$RealtimeAudioResponseCopyWithImpl<$Res, RealtimeAudioResponse>;
}

/// @nodoc
class _$RealtimeAudioResponseCopyWithImpl<$Res,
        $Val extends RealtimeAudioResponse>
    implements $RealtimeAudioResponseCopyWith<$Res> {
  _$RealtimeAudioResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RealtimeAudioResponseCreateImplCopyWith<$Res> {
  factory _$$RealtimeAudioResponseCreateImplCopyWith(
          _$RealtimeAudioResponseCreateImpl value,
          $Res Function(_$RealtimeAudioResponseCreateImpl) then) =
      __$$RealtimeAudioResponseCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RealtimeAudioResponseCreateImplCopyWithImpl<$Res>
    extends _$RealtimeAudioResponseCopyWithImpl<$Res,
        _$RealtimeAudioResponseCreateImpl>
    implements _$$RealtimeAudioResponseCreateImplCopyWith<$Res> {
  __$$RealtimeAudioResponseCreateImplCopyWithImpl(
      _$RealtimeAudioResponseCreateImpl _value,
      $Res Function(_$RealtimeAudioResponseCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RealtimeAudioResponseCreateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioResponseCreateImpl implements RealtimeAudioResponseCreate {
  const _$RealtimeAudioResponseCreateImpl(
      {required this.id, final String? $type})
      : $type = $type ?? 'create';

  factory _$RealtimeAudioResponseCreateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioResponseCreateImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RealtimeAudioResponse.create(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioResponseCreateImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioResponseCreateImplCopyWith<_$RealtimeAudioResponseCreateImpl>
      get copyWith => __$$RealtimeAudioResponseCreateImplCopyWithImpl<
          _$RealtimeAudioResponseCreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) create,
    required TResult Function() destroy,
    required TResult Function(RealtimeAudioRecordPermission permission)
        getRecordPermission,
    required TResult Function(RealtimeAudioRecordPermission permission)
        requestRecordPermission,
  }) {
    return create(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? create,
    TResult? Function()? destroy,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
  }) {
    return create?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? create,
    TResult Function()? destroy,
    TResult Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeAudioResponseCreate value) create,
    required TResult Function(RealtimeAudioResponseDestroy value) destroy,
    required TResult Function(RealtimeAudioResponseGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            RealtimeAudioResponseRequestRecordPermission value)
        requestRecordPermission,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeAudioResponseCreate value)? create,
    TResult? Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult? Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeAudioResponseCreate value)? create,
    TResult Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeAudioResponseCreateImplToJson(
      this,
    );
  }
}

abstract class RealtimeAudioResponseCreate implements RealtimeAudioResponse {
  const factory RealtimeAudioResponseCreate({required final String id}) =
      _$RealtimeAudioResponseCreateImpl;

  factory RealtimeAudioResponseCreate.fromJson(Map<String, dynamic> json) =
      _$RealtimeAudioResponseCreateImpl.fromJson;

  String get id;

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioResponseCreateImplCopyWith<_$RealtimeAudioResponseCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RealtimeAudioResponseDestroyImplCopyWith<$Res> {
  factory _$$RealtimeAudioResponseDestroyImplCopyWith(
          _$RealtimeAudioResponseDestroyImpl value,
          $Res Function(_$RealtimeAudioResponseDestroyImpl) then) =
      __$$RealtimeAudioResponseDestroyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RealtimeAudioResponseDestroyImplCopyWithImpl<$Res>
    extends _$RealtimeAudioResponseCopyWithImpl<$Res,
        _$RealtimeAudioResponseDestroyImpl>
    implements _$$RealtimeAudioResponseDestroyImplCopyWith<$Res> {
  __$$RealtimeAudioResponseDestroyImplCopyWithImpl(
      _$RealtimeAudioResponseDestroyImpl _value,
      $Res Function(_$RealtimeAudioResponseDestroyImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioResponseDestroyImpl
    implements RealtimeAudioResponseDestroy {
  const _$RealtimeAudioResponseDestroyImpl({final String? $type})
      : $type = $type ?? 'destroy';

  factory _$RealtimeAudioResponseDestroyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioResponseDestroyImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RealtimeAudioResponse.destroy()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioResponseDestroyImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) create,
    required TResult Function() destroy,
    required TResult Function(RealtimeAudioRecordPermission permission)
        getRecordPermission,
    required TResult Function(RealtimeAudioRecordPermission permission)
        requestRecordPermission,
  }) {
    return destroy();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? create,
    TResult? Function()? destroy,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
  }) {
    return destroy?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? create,
    TResult Function()? destroy,
    TResult Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
    required TResult orElse(),
  }) {
    if (destroy != null) {
      return destroy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeAudioResponseCreate value) create,
    required TResult Function(RealtimeAudioResponseDestroy value) destroy,
    required TResult Function(RealtimeAudioResponseGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            RealtimeAudioResponseRequestRecordPermission value)
        requestRecordPermission,
  }) {
    return destroy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeAudioResponseCreate value)? create,
    TResult? Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult? Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
  }) {
    return destroy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeAudioResponseCreate value)? create,
    TResult Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
    required TResult orElse(),
  }) {
    if (destroy != null) {
      return destroy(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeAudioResponseDestroyImplToJson(
      this,
    );
  }
}

abstract class RealtimeAudioResponseDestroy implements RealtimeAudioResponse {
  const factory RealtimeAudioResponseDestroy() =
      _$RealtimeAudioResponseDestroyImpl;

  factory RealtimeAudioResponseDestroy.fromJson(Map<String, dynamic> json) =
      _$RealtimeAudioResponseDestroyImpl.fromJson;
}

/// @nodoc
abstract class _$$RealtimeAudioResponseGetRecordPermissionImplCopyWith<$Res> {
  factory _$$RealtimeAudioResponseGetRecordPermissionImplCopyWith(
          _$RealtimeAudioResponseGetRecordPermissionImpl value,
          $Res Function(_$RealtimeAudioResponseGetRecordPermissionImpl) then) =
      __$$RealtimeAudioResponseGetRecordPermissionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RealtimeAudioRecordPermission permission});
}

/// @nodoc
class __$$RealtimeAudioResponseGetRecordPermissionImplCopyWithImpl<$Res>
    extends _$RealtimeAudioResponseCopyWithImpl<$Res,
        _$RealtimeAudioResponseGetRecordPermissionImpl>
    implements _$$RealtimeAudioResponseGetRecordPermissionImplCopyWith<$Res> {
  __$$RealtimeAudioResponseGetRecordPermissionImplCopyWithImpl(
      _$RealtimeAudioResponseGetRecordPermissionImpl _value,
      $Res Function(_$RealtimeAudioResponseGetRecordPermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
  }) {
    return _then(_$RealtimeAudioResponseGetRecordPermissionImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as RealtimeAudioRecordPermission,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioResponseGetRecordPermissionImpl
    implements RealtimeAudioResponseGetRecordPermission {
  const _$RealtimeAudioResponseGetRecordPermissionImpl(
      {required this.permission, final String? $type})
      : $type = $type ?? 'getRecordPermission';

  factory _$RealtimeAudioResponseGetRecordPermissionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioResponseGetRecordPermissionImplFromJson(json);

  @override
  final RealtimeAudioRecordPermission permission;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RealtimeAudioResponse.getRecordPermission(permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioResponseGetRecordPermissionImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, permission);

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioResponseGetRecordPermissionImplCopyWith<
          _$RealtimeAudioResponseGetRecordPermissionImpl>
      get copyWith =>
          __$$RealtimeAudioResponseGetRecordPermissionImplCopyWithImpl<
              _$RealtimeAudioResponseGetRecordPermissionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) create,
    required TResult Function() destroy,
    required TResult Function(RealtimeAudioRecordPermission permission)
        getRecordPermission,
    required TResult Function(RealtimeAudioRecordPermission permission)
        requestRecordPermission,
  }) {
    return getRecordPermission(permission);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? create,
    TResult? Function()? destroy,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
  }) {
    return getRecordPermission?.call(permission);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? create,
    TResult Function()? destroy,
    TResult Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
    required TResult orElse(),
  }) {
    if (getRecordPermission != null) {
      return getRecordPermission(permission);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeAudioResponseCreate value) create,
    required TResult Function(RealtimeAudioResponseDestroy value) destroy,
    required TResult Function(RealtimeAudioResponseGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            RealtimeAudioResponseRequestRecordPermission value)
        requestRecordPermission,
  }) {
    return getRecordPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeAudioResponseCreate value)? create,
    TResult? Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult? Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
  }) {
    return getRecordPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeAudioResponseCreate value)? create,
    TResult Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
    required TResult orElse(),
  }) {
    if (getRecordPermission != null) {
      return getRecordPermission(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeAudioResponseGetRecordPermissionImplToJson(
      this,
    );
  }
}

abstract class RealtimeAudioResponseGetRecordPermission
    implements RealtimeAudioResponse {
  const factory RealtimeAudioResponseGetRecordPermission(
          {required final RealtimeAudioRecordPermission permission}) =
      _$RealtimeAudioResponseGetRecordPermissionImpl;

  factory RealtimeAudioResponseGetRecordPermission.fromJson(
          Map<String, dynamic> json) =
      _$RealtimeAudioResponseGetRecordPermissionImpl.fromJson;

  RealtimeAudioRecordPermission get permission;

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioResponseGetRecordPermissionImplCopyWith<
          _$RealtimeAudioResponseGetRecordPermissionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RealtimeAudioResponseRequestRecordPermissionImplCopyWith<
    $Res> {
  factory _$$RealtimeAudioResponseRequestRecordPermissionImplCopyWith(
          _$RealtimeAudioResponseRequestRecordPermissionImpl value,
          $Res Function(_$RealtimeAudioResponseRequestRecordPermissionImpl)
              then) =
      __$$RealtimeAudioResponseRequestRecordPermissionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RealtimeAudioRecordPermission permission});
}

/// @nodoc
class __$$RealtimeAudioResponseRequestRecordPermissionImplCopyWithImpl<$Res>
    extends _$RealtimeAudioResponseCopyWithImpl<$Res,
        _$RealtimeAudioResponseRequestRecordPermissionImpl>
    implements
        _$$RealtimeAudioResponseRequestRecordPermissionImplCopyWith<$Res> {
  __$$RealtimeAudioResponseRequestRecordPermissionImplCopyWithImpl(
      _$RealtimeAudioResponseRequestRecordPermissionImpl _value,
      $Res Function(_$RealtimeAudioResponseRequestRecordPermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
  }) {
    return _then(_$RealtimeAudioResponseRequestRecordPermissionImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as RealtimeAudioRecordPermission,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioResponseRequestRecordPermissionImpl
    implements RealtimeAudioResponseRequestRecordPermission {
  const _$RealtimeAudioResponseRequestRecordPermissionImpl(
      {required this.permission, final String? $type})
      : $type = $type ?? 'requestRecordPermission';

  factory _$RealtimeAudioResponseRequestRecordPermissionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioResponseRequestRecordPermissionImplFromJson(json);

  @override
  final RealtimeAudioRecordPermission permission;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RealtimeAudioResponse.requestRecordPermission(permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioResponseRequestRecordPermissionImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, permission);

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioResponseRequestRecordPermissionImplCopyWith<
          _$RealtimeAudioResponseRequestRecordPermissionImpl>
      get copyWith =>
          __$$RealtimeAudioResponseRequestRecordPermissionImplCopyWithImpl<
                  _$RealtimeAudioResponseRequestRecordPermissionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) create,
    required TResult Function() destroy,
    required TResult Function(RealtimeAudioRecordPermission permission)
        getRecordPermission,
    required TResult Function(RealtimeAudioRecordPermission permission)
        requestRecordPermission,
  }) {
    return requestRecordPermission(permission);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? create,
    TResult? Function()? destroy,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult? Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
  }) {
    return requestRecordPermission?.call(permission);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? create,
    TResult Function()? destroy,
    TResult Function(RealtimeAudioRecordPermission permission)?
        getRecordPermission,
    TResult Function(RealtimeAudioRecordPermission permission)?
        requestRecordPermission,
    required TResult orElse(),
  }) {
    if (requestRecordPermission != null) {
      return requestRecordPermission(permission);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeAudioResponseCreate value) create,
    required TResult Function(RealtimeAudioResponseDestroy value) destroy,
    required TResult Function(RealtimeAudioResponseGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            RealtimeAudioResponseRequestRecordPermission value)
        requestRecordPermission,
  }) {
    return requestRecordPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeAudioResponseCreate value)? create,
    TResult? Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult? Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
  }) {
    return requestRecordPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeAudioResponseCreate value)? create,
    TResult Function(RealtimeAudioResponseDestroy value)? destroy,
    TResult Function(RealtimeAudioResponseGetRecordPermission value)?
        getRecordPermission,
    TResult Function(RealtimeAudioResponseRequestRecordPermission value)?
        requestRecordPermission,
    required TResult orElse(),
  }) {
    if (requestRecordPermission != null) {
      return requestRecordPermission(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeAudioResponseRequestRecordPermissionImplToJson(
      this,
    );
  }
}

abstract class RealtimeAudioResponseRequestRecordPermission
    implements RealtimeAudioResponse {
  const factory RealtimeAudioResponseRequestRecordPermission(
          {required final RealtimeAudioRecordPermission permission}) =
      _$RealtimeAudioResponseRequestRecordPermissionImpl;

  factory RealtimeAudioResponseRequestRecordPermission.fromJson(
          Map<String, dynamic> json) =
      _$RealtimeAudioResponseRequestRecordPermissionImpl.fromJson;

  RealtimeAudioRecordPermission get permission;

  /// Create a copy of RealtimeAudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioResponseRequestRecordPermissionImplCopyWith<
          _$RealtimeAudioResponseRequestRecordPermissionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
