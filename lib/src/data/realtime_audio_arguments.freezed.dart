// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RealtimeAudioArguments _$RealtimeAudioArgumentsFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'create':
      return _RealtimeAudioArgumentsCreate.fromJson(json);
    case 'destroy':
      return _RealtimeAudioArgumentsDestroy.fromJson(json);
    case 'getRecordPermission':
      return _RealtimeAudioArgumentsGetRecordPermission.fromJson(json);
    case 'requestRecordPermission':
      return _RealtimeAudioArgumentsRequestRecordPermission.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'RealtimeAudioArguments',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RealtimeAudioArguments {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)
        create,
    required TResult Function(String id) destroy,
    required TResult Function() getRecordPermission,
    required TResult Function() requestRecordPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult? Function(String id)? destroy,
    TResult? Function()? getRecordPermission,
    TResult? Function()? requestRecordPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult Function(String id)? destroy,
    TResult Function()? getRecordPermission,
    TResult Function()? requestRecordPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealtimeAudioArgumentsCreate value) create,
    required TResult Function(_RealtimeAudioArgumentsDestroy value) destroy,
    required TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            _RealtimeAudioArgumentsRequestRecordPermission value)
        requestRecordPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult? Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult? Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
        requestRecordPermission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
        requestRecordPermission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this RealtimeAudioArguments to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeAudioArgumentsCopyWith<$Res> {
  factory $RealtimeAudioArgumentsCopyWith(RealtimeAudioArguments value,
          $Res Function(RealtimeAudioArguments) then) =
      _$RealtimeAudioArgumentsCopyWithImpl<$Res, RealtimeAudioArguments>;
}

/// @nodoc
class _$RealtimeAudioArgumentsCopyWithImpl<$Res,
        $Val extends RealtimeAudioArguments>
    implements $RealtimeAudioArgumentsCopyWith<$Res> {
  _$RealtimeAudioArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeAudioArguments
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RealtimeAudioArgumentsCreateImplCopyWith<$Res> {
  factory _$$RealtimeAudioArgumentsCreateImplCopyWith(
          _$RealtimeAudioArgumentsCreateImpl value,
          $Res Function(_$RealtimeAudioArgumentsCreateImpl) then) =
      __$$RealtimeAudioArgumentsCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool isFirstCreate,
      bool voiceProcessing,
      bool backgroundEnabled,
      bool recorderEnabled,
      int recorderSampleRate,
      int playerSampleRate,
      int playerProgressInterval,
      int playerVolumeInterval,
      int recorderChunkInterval,
      double backgroundVolume});
}

/// @nodoc
class __$$RealtimeAudioArgumentsCreateImplCopyWithImpl<$Res>
    extends _$RealtimeAudioArgumentsCopyWithImpl<$Res,
        _$RealtimeAudioArgumentsCreateImpl>
    implements _$$RealtimeAudioArgumentsCreateImplCopyWith<$Res> {
  __$$RealtimeAudioArgumentsCreateImplCopyWithImpl(
      _$RealtimeAudioArgumentsCreateImpl _value,
      $Res Function(_$RealtimeAudioArgumentsCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioArguments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstCreate = null,
    Object? voiceProcessing = null,
    Object? backgroundEnabled = null,
    Object? recorderEnabled = null,
    Object? recorderSampleRate = null,
    Object? playerSampleRate = null,
    Object? playerProgressInterval = null,
    Object? playerVolumeInterval = null,
    Object? recorderChunkInterval = null,
    Object? backgroundVolume = null,
  }) {
    return _then(_$RealtimeAudioArgumentsCreateImpl(
      isFirstCreate: null == isFirstCreate
          ? _value.isFirstCreate
          : isFirstCreate // ignore: cast_nullable_to_non_nullable
              as bool,
      voiceProcessing: null == voiceProcessing
          ? _value.voiceProcessing
          : voiceProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundEnabled: null == backgroundEnabled
          ? _value.backgroundEnabled
          : backgroundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      recorderEnabled: null == recorderEnabled
          ? _value.recorderEnabled
          : recorderEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      recorderSampleRate: null == recorderSampleRate
          ? _value.recorderSampleRate
          : recorderSampleRate // ignore: cast_nullable_to_non_nullable
              as int,
      playerSampleRate: null == playerSampleRate
          ? _value.playerSampleRate
          : playerSampleRate // ignore: cast_nullable_to_non_nullable
              as int,
      playerProgressInterval: null == playerProgressInterval
          ? _value.playerProgressInterval
          : playerProgressInterval // ignore: cast_nullable_to_non_nullable
              as int,
      playerVolumeInterval: null == playerVolumeInterval
          ? _value.playerVolumeInterval
          : playerVolumeInterval // ignore: cast_nullable_to_non_nullable
              as int,
      recorderChunkInterval: null == recorderChunkInterval
          ? _value.recorderChunkInterval
          : recorderChunkInterval // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundVolume: null == backgroundVolume
          ? _value.backgroundVolume
          : backgroundVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioArgumentsCreateImpl extends _RealtimeAudioArgumentsCreate {
  const _$RealtimeAudioArgumentsCreateImpl(
      {required this.isFirstCreate,
      this.voiceProcessing = true,
      this.backgroundEnabled = false,
      this.recorderEnabled = false,
      this.recorderSampleRate = 24000,
      this.playerSampleRate = 24000,
      this.playerProgressInterval = 10,
      this.playerVolumeInterval = 40,
      this.recorderChunkInterval = 40,
      this.backgroundVolume = 1.0,
      final String? $type})
      : $type = $type ?? 'create',
        super._();

  factory _$RealtimeAudioArgumentsCreateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioArgumentsCreateImplFromJson(json);

  @override
  final bool isFirstCreate;
  @override
  @JsonKey()
  final bool voiceProcessing;
  @override
  @JsonKey()
  final bool backgroundEnabled;
  @override
  @JsonKey()
  final bool recorderEnabled;
  @override
  @JsonKey()
  final int recorderSampleRate;
  @override
  @JsonKey()
  final int playerSampleRate;
  @override
  @JsonKey()
  final int playerProgressInterval;
  @override
  @JsonKey()
  final int playerVolumeInterval;
  @override
  @JsonKey()
  final int recorderChunkInterval;
  @override
  @JsonKey()
  final double backgroundVolume;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RealtimeAudioArguments.create(isFirstCreate: $isFirstCreate, voiceProcessing: $voiceProcessing, backgroundEnabled: $backgroundEnabled, recorderEnabled: $recorderEnabled, recorderSampleRate: $recorderSampleRate, playerSampleRate: $playerSampleRate, playerProgressInterval: $playerProgressInterval, playerVolumeInterval: $playerVolumeInterval, recorderChunkInterval: $recorderChunkInterval, backgroundVolume: $backgroundVolume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioArgumentsCreateImpl &&
            (identical(other.isFirstCreate, isFirstCreate) ||
                other.isFirstCreate == isFirstCreate) &&
            (identical(other.voiceProcessing, voiceProcessing) ||
                other.voiceProcessing == voiceProcessing) &&
            (identical(other.backgroundEnabled, backgroundEnabled) ||
                other.backgroundEnabled == backgroundEnabled) &&
            (identical(other.recorderEnabled, recorderEnabled) ||
                other.recorderEnabled == recorderEnabled) &&
            (identical(other.recorderSampleRate, recorderSampleRate) ||
                other.recorderSampleRate == recorderSampleRate) &&
            (identical(other.playerSampleRate, playerSampleRate) ||
                other.playerSampleRate == playerSampleRate) &&
            (identical(other.playerProgressInterval, playerProgressInterval) ||
                other.playerProgressInterval == playerProgressInterval) &&
            (identical(other.playerVolumeInterval, playerVolumeInterval) ||
                other.playerVolumeInterval == playerVolumeInterval) &&
            (identical(other.recorderChunkInterval, recorderChunkInterval) ||
                other.recorderChunkInterval == recorderChunkInterval) &&
            (identical(other.backgroundVolume, backgroundVolume) ||
                other.backgroundVolume == backgroundVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFirstCreate,
      voiceProcessing,
      backgroundEnabled,
      recorderEnabled,
      recorderSampleRate,
      playerSampleRate,
      playerProgressInterval,
      playerVolumeInterval,
      recorderChunkInterval,
      backgroundVolume);

  /// Create a copy of RealtimeAudioArguments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioArgumentsCreateImplCopyWith<
          _$RealtimeAudioArgumentsCreateImpl>
      get copyWith => __$$RealtimeAudioArgumentsCreateImplCopyWithImpl<
          _$RealtimeAudioArgumentsCreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)
        create,
    required TResult Function(String id) destroy,
    required TResult Function() getRecordPermission,
    required TResult Function() requestRecordPermission,
  }) {
    return create(
        isFirstCreate,
        voiceProcessing,
        backgroundEnabled,
        recorderEnabled,
        recorderSampleRate,
        playerSampleRate,
        playerProgressInterval,
        playerVolumeInterval,
        recorderChunkInterval,
        backgroundVolume);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult? Function(String id)? destroy,
    TResult? Function()? getRecordPermission,
    TResult? Function()? requestRecordPermission,
  }) {
    return create?.call(
        isFirstCreate,
        voiceProcessing,
        backgroundEnabled,
        recorderEnabled,
        recorderSampleRate,
        playerSampleRate,
        playerProgressInterval,
        playerVolumeInterval,
        recorderChunkInterval,
        backgroundVolume);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult Function(String id)? destroy,
    TResult Function()? getRecordPermission,
    TResult Function()? requestRecordPermission,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(
          isFirstCreate,
          voiceProcessing,
          backgroundEnabled,
          recorderEnabled,
          recorderSampleRate,
          playerSampleRate,
          playerProgressInterval,
          playerVolumeInterval,
          recorderChunkInterval,
          backgroundVolume);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealtimeAudioArgumentsCreate value) create,
    required TResult Function(_RealtimeAudioArgumentsDestroy value) destroy,
    required TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            _RealtimeAudioArgumentsRequestRecordPermission value)
        requestRecordPermission,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult? Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult? Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
        requestRecordPermission,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
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
    return _$$RealtimeAudioArgumentsCreateImplToJson(
      this,
    );
  }
}

abstract class _RealtimeAudioArgumentsCreate extends RealtimeAudioArguments {
  const factory _RealtimeAudioArgumentsCreate(
      {required final bool isFirstCreate,
      final bool voiceProcessing,
      final bool backgroundEnabled,
      final bool recorderEnabled,
      final int recorderSampleRate,
      final int playerSampleRate,
      final int playerProgressInterval,
      final int playerVolumeInterval,
      final int recorderChunkInterval,
      final double backgroundVolume}) = _$RealtimeAudioArgumentsCreateImpl;
  const _RealtimeAudioArgumentsCreate._() : super._();

  factory _RealtimeAudioArgumentsCreate.fromJson(Map<String, dynamic> json) =
      _$RealtimeAudioArgumentsCreateImpl.fromJson;

  bool get isFirstCreate;
  bool get voiceProcessing;
  bool get backgroundEnabled;
  bool get recorderEnabled;
  int get recorderSampleRate;
  int get playerSampleRate;
  int get playerProgressInterval;
  int get playerVolumeInterval;
  int get recorderChunkInterval;
  double get backgroundVolume;

  /// Create a copy of RealtimeAudioArguments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioArgumentsCreateImplCopyWith<
          _$RealtimeAudioArgumentsCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RealtimeAudioArgumentsDestroyImplCopyWith<$Res> {
  factory _$$RealtimeAudioArgumentsDestroyImplCopyWith(
          _$RealtimeAudioArgumentsDestroyImpl value,
          $Res Function(_$RealtimeAudioArgumentsDestroyImpl) then) =
      __$$RealtimeAudioArgumentsDestroyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RealtimeAudioArgumentsDestroyImplCopyWithImpl<$Res>
    extends _$RealtimeAudioArgumentsCopyWithImpl<$Res,
        _$RealtimeAudioArgumentsDestroyImpl>
    implements _$$RealtimeAudioArgumentsDestroyImplCopyWith<$Res> {
  __$$RealtimeAudioArgumentsDestroyImplCopyWithImpl(
      _$RealtimeAudioArgumentsDestroyImpl _value,
      $Res Function(_$RealtimeAudioArgumentsDestroyImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioArguments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RealtimeAudioArgumentsDestroyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioArgumentsDestroyImpl
    extends _RealtimeAudioArgumentsDestroy {
  const _$RealtimeAudioArgumentsDestroyImpl(
      {required this.id, final String? $type})
      : $type = $type ?? 'destroy',
        super._();

  factory _$RealtimeAudioArgumentsDestroyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioArgumentsDestroyImplFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RealtimeAudioArguments.destroy(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioArgumentsDestroyImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RealtimeAudioArguments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioArgumentsDestroyImplCopyWith<
          _$RealtimeAudioArgumentsDestroyImpl>
      get copyWith => __$$RealtimeAudioArgumentsDestroyImplCopyWithImpl<
          _$RealtimeAudioArgumentsDestroyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)
        create,
    required TResult Function(String id) destroy,
    required TResult Function() getRecordPermission,
    required TResult Function() requestRecordPermission,
  }) {
    return destroy(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult? Function(String id)? destroy,
    TResult? Function()? getRecordPermission,
    TResult? Function()? requestRecordPermission,
  }) {
    return destroy?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult Function(String id)? destroy,
    TResult Function()? getRecordPermission,
    TResult Function()? requestRecordPermission,
    required TResult orElse(),
  }) {
    if (destroy != null) {
      return destroy(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealtimeAudioArgumentsCreate value) create,
    required TResult Function(_RealtimeAudioArgumentsDestroy value) destroy,
    required TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            _RealtimeAudioArgumentsRequestRecordPermission value)
        requestRecordPermission,
  }) {
    return destroy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult? Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult? Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
        requestRecordPermission,
  }) {
    return destroy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
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
    return _$$RealtimeAudioArgumentsDestroyImplToJson(
      this,
    );
  }
}

abstract class _RealtimeAudioArgumentsDestroy extends RealtimeAudioArguments {
  const factory _RealtimeAudioArgumentsDestroy({required final String id}) =
      _$RealtimeAudioArgumentsDestroyImpl;
  const _RealtimeAudioArgumentsDestroy._() : super._();

  factory _RealtimeAudioArgumentsDestroy.fromJson(Map<String, dynamic> json) =
      _$RealtimeAudioArgumentsDestroyImpl.fromJson;

  String get id;

  /// Create a copy of RealtimeAudioArguments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioArgumentsDestroyImplCopyWith<
          _$RealtimeAudioArgumentsDestroyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RealtimeAudioArgumentsGetRecordPermissionImplCopyWith<$Res> {
  factory _$$RealtimeAudioArgumentsGetRecordPermissionImplCopyWith(
          _$RealtimeAudioArgumentsGetRecordPermissionImpl value,
          $Res Function(_$RealtimeAudioArgumentsGetRecordPermissionImpl) then) =
      __$$RealtimeAudioArgumentsGetRecordPermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RealtimeAudioArgumentsGetRecordPermissionImplCopyWithImpl<$Res>
    extends _$RealtimeAudioArgumentsCopyWithImpl<$Res,
        _$RealtimeAudioArgumentsGetRecordPermissionImpl>
    implements _$$RealtimeAudioArgumentsGetRecordPermissionImplCopyWith<$Res> {
  __$$RealtimeAudioArgumentsGetRecordPermissionImplCopyWithImpl(
      _$RealtimeAudioArgumentsGetRecordPermissionImpl _value,
      $Res Function(_$RealtimeAudioArgumentsGetRecordPermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioArguments
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioArgumentsGetRecordPermissionImpl
    extends _RealtimeAudioArgumentsGetRecordPermission {
  const _$RealtimeAudioArgumentsGetRecordPermissionImpl({final String? $type})
      : $type = $type ?? 'getRecordPermission',
        super._();

  factory _$RealtimeAudioArgumentsGetRecordPermissionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioArgumentsGetRecordPermissionImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RealtimeAudioArguments.getRecordPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioArgumentsGetRecordPermissionImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)
        create,
    required TResult Function(String id) destroy,
    required TResult Function() getRecordPermission,
    required TResult Function() requestRecordPermission,
  }) {
    return getRecordPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult? Function(String id)? destroy,
    TResult? Function()? getRecordPermission,
    TResult? Function()? requestRecordPermission,
  }) {
    return getRecordPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult Function(String id)? destroy,
    TResult Function()? getRecordPermission,
    TResult Function()? requestRecordPermission,
    required TResult orElse(),
  }) {
    if (getRecordPermission != null) {
      return getRecordPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealtimeAudioArgumentsCreate value) create,
    required TResult Function(_RealtimeAudioArgumentsDestroy value) destroy,
    required TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            _RealtimeAudioArgumentsRequestRecordPermission value)
        requestRecordPermission,
  }) {
    return getRecordPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult? Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult? Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
        requestRecordPermission,
  }) {
    return getRecordPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
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
    return _$$RealtimeAudioArgumentsGetRecordPermissionImplToJson(
      this,
    );
  }
}

abstract class _RealtimeAudioArgumentsGetRecordPermission
    extends RealtimeAudioArguments {
  const factory _RealtimeAudioArgumentsGetRecordPermission() =
      _$RealtimeAudioArgumentsGetRecordPermissionImpl;
  const _RealtimeAudioArgumentsGetRecordPermission._() : super._();

  factory _RealtimeAudioArgumentsGetRecordPermission.fromJson(
          Map<String, dynamic> json) =
      _$RealtimeAudioArgumentsGetRecordPermissionImpl.fromJson;
}

/// @nodoc
abstract class _$$RealtimeAudioArgumentsRequestRecordPermissionImplCopyWith<
    $Res> {
  factory _$$RealtimeAudioArgumentsRequestRecordPermissionImplCopyWith(
          _$RealtimeAudioArgumentsRequestRecordPermissionImpl value,
          $Res Function(_$RealtimeAudioArgumentsRequestRecordPermissionImpl)
              then) =
      __$$RealtimeAudioArgumentsRequestRecordPermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RealtimeAudioArgumentsRequestRecordPermissionImplCopyWithImpl<$Res>
    extends _$RealtimeAudioArgumentsCopyWithImpl<$Res,
        _$RealtimeAudioArgumentsRequestRecordPermissionImpl>
    implements
        _$$RealtimeAudioArgumentsRequestRecordPermissionImplCopyWith<$Res> {
  __$$RealtimeAudioArgumentsRequestRecordPermissionImplCopyWithImpl(
      _$RealtimeAudioArgumentsRequestRecordPermissionImpl _value,
      $Res Function(_$RealtimeAudioArgumentsRequestRecordPermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioArguments
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioArgumentsRequestRecordPermissionImpl
    extends _RealtimeAudioArgumentsRequestRecordPermission {
  const _$RealtimeAudioArgumentsRequestRecordPermissionImpl(
      {final String? $type})
      : $type = $type ?? 'requestRecordPermission',
        super._();

  factory _$RealtimeAudioArgumentsRequestRecordPermissionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioArgumentsRequestRecordPermissionImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RealtimeAudioArguments.requestRecordPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioArgumentsRequestRecordPermissionImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)
        create,
    required TResult Function(String id) destroy,
    required TResult Function() getRecordPermission,
    required TResult Function() requestRecordPermission,
  }) {
    return requestRecordPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult? Function(String id)? destroy,
    TResult? Function()? getRecordPermission,
    TResult? Function()? requestRecordPermission,
  }) {
    return requestRecordPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isFirstCreate,
            bool voiceProcessing,
            bool backgroundEnabled,
            bool recorderEnabled,
            int recorderSampleRate,
            int playerSampleRate,
            int playerProgressInterval,
            int playerVolumeInterval,
            int recorderChunkInterval,
            double backgroundVolume)?
        create,
    TResult Function(String id)? destroy,
    TResult Function()? getRecordPermission,
    TResult Function()? requestRecordPermission,
    required TResult orElse(),
  }) {
    if (requestRecordPermission != null) {
      return requestRecordPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealtimeAudioArgumentsCreate value) create,
    required TResult Function(_RealtimeAudioArgumentsDestroy value) destroy,
    required TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)
        getRecordPermission,
    required TResult Function(
            _RealtimeAudioArgumentsRequestRecordPermission value)
        requestRecordPermission,
  }) {
    return requestRecordPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult? Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult? Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult? Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
        requestRecordPermission,
  }) {
    return requestRecordPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealtimeAudioArgumentsCreate value)? create,
    TResult Function(_RealtimeAudioArgumentsDestroy value)? destroy,
    TResult Function(_RealtimeAudioArgumentsGetRecordPermission value)?
        getRecordPermission,
    TResult Function(_RealtimeAudioArgumentsRequestRecordPermission value)?
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
    return _$$RealtimeAudioArgumentsRequestRecordPermissionImplToJson(
      this,
    );
  }
}

abstract class _RealtimeAudioArgumentsRequestRecordPermission
    extends RealtimeAudioArguments {
  const factory _RealtimeAudioArgumentsRequestRecordPermission() =
      _$RealtimeAudioArgumentsRequestRecordPermissionImpl;
  const _RealtimeAudioArgumentsRequestRecordPermission._() : super._();

  factory _RealtimeAudioArgumentsRequestRecordPermission.fromJson(
          Map<String, dynamic> json) =
      _$RealtimeAudioArgumentsRequestRecordPermissionImpl.fromJson;
}
