// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_instance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RealtimeAudioInstanceResponse _$RealtimeAudioInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return RealtimeAudioInstanceResponseClearQueue.fromJson(json);
}

/// @nodoc
mixin _$RealtimeAudioInstanceResponse {
  RealtimeAudioClearQueueChunkData? get chunk =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RealtimeAudioClearQueueChunkData? chunk)
        clearQueue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RealtimeAudioClearQueueChunkData? chunk)? clearQueue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RealtimeAudioClearQueueChunkData? chunk)? clearQueue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeAudioInstanceResponseClearQueue value)
        clearQueue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeAudioInstanceResponseClearQueue value)?
        clearQueue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeAudioInstanceResponseClearQueue value)? clearQueue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this RealtimeAudioInstanceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RealtimeAudioInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealtimeAudioInstanceResponseCopyWith<RealtimeAudioInstanceResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeAudioInstanceResponseCopyWith<$Res> {
  factory $RealtimeAudioInstanceResponseCopyWith(
          RealtimeAudioInstanceResponse value,
          $Res Function(RealtimeAudioInstanceResponse) then) =
      _$RealtimeAudioInstanceResponseCopyWithImpl<$Res,
          RealtimeAudioInstanceResponse>;
  @useResult
  $Res call({RealtimeAudioClearQueueChunkData? chunk});

  $RealtimeAudioClearQueueChunkDataCopyWith<$Res>? get chunk;
}

/// @nodoc
class _$RealtimeAudioInstanceResponseCopyWithImpl<$Res,
        $Val extends RealtimeAudioInstanceResponse>
    implements $RealtimeAudioInstanceResponseCopyWith<$Res> {
  _$RealtimeAudioInstanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeAudioInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chunk = freezed,
  }) {
    return _then(_value.copyWith(
      chunk: freezed == chunk
          ? _value.chunk
          : chunk // ignore: cast_nullable_to_non_nullable
              as RealtimeAudioClearQueueChunkData?,
    ) as $Val);
  }

  /// Create a copy of RealtimeAudioInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RealtimeAudioClearQueueChunkDataCopyWith<$Res>? get chunk {
    if (_value.chunk == null) {
      return null;
    }

    return $RealtimeAudioClearQueueChunkDataCopyWith<$Res>(_value.chunk!,
        (value) {
      return _then(_value.copyWith(chunk: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RealtimeAudioInstanceResponseClearQueueImplCopyWith<$Res>
    implements $RealtimeAudioInstanceResponseCopyWith<$Res> {
  factory _$$RealtimeAudioInstanceResponseClearQueueImplCopyWith(
          _$RealtimeAudioInstanceResponseClearQueueImpl value,
          $Res Function(_$RealtimeAudioInstanceResponseClearQueueImpl) then) =
      __$$RealtimeAudioInstanceResponseClearQueueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RealtimeAudioClearQueueChunkData? chunk});

  @override
  $RealtimeAudioClearQueueChunkDataCopyWith<$Res>? get chunk;
}

/// @nodoc
class __$$RealtimeAudioInstanceResponseClearQueueImplCopyWithImpl<$Res>
    extends _$RealtimeAudioInstanceResponseCopyWithImpl<$Res,
        _$RealtimeAudioInstanceResponseClearQueueImpl>
    implements _$$RealtimeAudioInstanceResponseClearQueueImplCopyWith<$Res> {
  __$$RealtimeAudioInstanceResponseClearQueueImplCopyWithImpl(
      _$RealtimeAudioInstanceResponseClearQueueImpl _value,
      $Res Function(_$RealtimeAudioInstanceResponseClearQueueImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chunk = freezed,
  }) {
    return _then(_$RealtimeAudioInstanceResponseClearQueueImpl(
      chunk: freezed == chunk
          ? _value.chunk
          : chunk // ignore: cast_nullable_to_non_nullable
              as RealtimeAudioClearQueueChunkData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioInstanceResponseClearQueueImpl
    implements RealtimeAudioInstanceResponseClearQueue {
  const _$RealtimeAudioInstanceResponseClearQueueImpl({this.chunk});

  factory _$RealtimeAudioInstanceResponseClearQueueImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioInstanceResponseClearQueueImplFromJson(json);

  @override
  final RealtimeAudioClearQueueChunkData? chunk;

  @override
  String toString() {
    return 'RealtimeAudioInstanceResponse.clearQueue(chunk: $chunk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioInstanceResponseClearQueueImpl &&
            (identical(other.chunk, chunk) || other.chunk == chunk));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chunk);

  /// Create a copy of RealtimeAudioInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioInstanceResponseClearQueueImplCopyWith<
          _$RealtimeAudioInstanceResponseClearQueueImpl>
      get copyWith =>
          __$$RealtimeAudioInstanceResponseClearQueueImplCopyWithImpl<
              _$RealtimeAudioInstanceResponseClearQueueImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RealtimeAudioClearQueueChunkData? chunk)
        clearQueue,
  }) {
    return clearQueue(chunk);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RealtimeAudioClearQueueChunkData? chunk)? clearQueue,
  }) {
    return clearQueue?.call(chunk);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RealtimeAudioClearQueueChunkData? chunk)? clearQueue,
    required TResult orElse(),
  }) {
    if (clearQueue != null) {
      return clearQueue(chunk);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealtimeAudioInstanceResponseClearQueue value)
        clearQueue,
  }) {
    return clearQueue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RealtimeAudioInstanceResponseClearQueue value)?
        clearQueue,
  }) {
    return clearQueue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealtimeAudioInstanceResponseClearQueue value)? clearQueue,
    required TResult orElse(),
  }) {
    if (clearQueue != null) {
      return clearQueue(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeAudioInstanceResponseClearQueueImplToJson(
      this,
    );
  }
}

abstract class RealtimeAudioInstanceResponseClearQueue
    implements RealtimeAudioInstanceResponse {
  const factory RealtimeAudioInstanceResponseClearQueue(
          {final RealtimeAudioClearQueueChunkData? chunk}) =
      _$RealtimeAudioInstanceResponseClearQueueImpl;

  factory RealtimeAudioInstanceResponseClearQueue.fromJson(
          Map<String, dynamic> json) =
      _$RealtimeAudioInstanceResponseClearQueueImpl.fromJson;

  @override
  RealtimeAudioClearQueueChunkData? get chunk;

  /// Create a copy of RealtimeAudioInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioInstanceResponseClearQueueImplCopyWith<
          _$RealtimeAudioInstanceResponseClearQueueImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RealtimeAudioClearQueueChunkData _$RealtimeAudioClearQueueChunkDataFromJson(
    Map<String, dynamic> json) {
  return _RealtimeAudioClearQueueChunkData.fromJson(json);
}

/// @nodoc
mixin _$RealtimeAudioClearQueueChunkData {
  String get id => throw _privateConstructorUsedError;
  double get sampleRate => throw _privateConstructorUsedError;
  int get sampleTime => throw _privateConstructorUsedError;
  int get sampleTimeTotal => throw _privateConstructorUsedError;
  int get chunkSampleTime => throw _privateConstructorUsedError;
  int get chunkSampleTimeTotal => throw _privateConstructorUsedError;

  /// Serializes this RealtimeAudioClearQueueChunkData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RealtimeAudioClearQueueChunkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealtimeAudioClearQueueChunkDataCopyWith<RealtimeAudioClearQueueChunkData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeAudioClearQueueChunkDataCopyWith<$Res> {
  factory $RealtimeAudioClearQueueChunkDataCopyWith(
          RealtimeAudioClearQueueChunkData value,
          $Res Function(RealtimeAudioClearQueueChunkData) then) =
      _$RealtimeAudioClearQueueChunkDataCopyWithImpl<$Res,
          RealtimeAudioClearQueueChunkData>;
  @useResult
  $Res call(
      {String id,
      double sampleRate,
      int sampleTime,
      int sampleTimeTotal,
      int chunkSampleTime,
      int chunkSampleTimeTotal});
}

/// @nodoc
class _$RealtimeAudioClearQueueChunkDataCopyWithImpl<$Res,
        $Val extends RealtimeAudioClearQueueChunkData>
    implements $RealtimeAudioClearQueueChunkDataCopyWith<$Res> {
  _$RealtimeAudioClearQueueChunkDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeAudioClearQueueChunkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sampleRate = null,
    Object? sampleTime = null,
    Object? sampleTimeTotal = null,
    Object? chunkSampleTime = null,
    Object? chunkSampleTimeTotal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sampleRate: null == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as double,
      sampleTime: null == sampleTime
          ? _value.sampleTime
          : sampleTime // ignore: cast_nullable_to_non_nullable
              as int,
      sampleTimeTotal: null == sampleTimeTotal
          ? _value.sampleTimeTotal
          : sampleTimeTotal // ignore: cast_nullable_to_non_nullable
              as int,
      chunkSampleTime: null == chunkSampleTime
          ? _value.chunkSampleTime
          : chunkSampleTime // ignore: cast_nullable_to_non_nullable
              as int,
      chunkSampleTimeTotal: null == chunkSampleTimeTotal
          ? _value.chunkSampleTimeTotal
          : chunkSampleTimeTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealtimeAudioClearQueueChunkDataImplCopyWith<$Res>
    implements $RealtimeAudioClearQueueChunkDataCopyWith<$Res> {
  factory _$$RealtimeAudioClearQueueChunkDataImplCopyWith(
          _$RealtimeAudioClearQueueChunkDataImpl value,
          $Res Function(_$RealtimeAudioClearQueueChunkDataImpl) then) =
      __$$RealtimeAudioClearQueueChunkDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double sampleRate,
      int sampleTime,
      int sampleTimeTotal,
      int chunkSampleTime,
      int chunkSampleTimeTotal});
}

/// @nodoc
class __$$RealtimeAudioClearQueueChunkDataImplCopyWithImpl<$Res>
    extends _$RealtimeAudioClearQueueChunkDataCopyWithImpl<$Res,
        _$RealtimeAudioClearQueueChunkDataImpl>
    implements _$$RealtimeAudioClearQueueChunkDataImplCopyWith<$Res> {
  __$$RealtimeAudioClearQueueChunkDataImplCopyWithImpl(
      _$RealtimeAudioClearQueueChunkDataImpl _value,
      $Res Function(_$RealtimeAudioClearQueueChunkDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioClearQueueChunkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sampleRate = null,
    Object? sampleTime = null,
    Object? sampleTimeTotal = null,
    Object? chunkSampleTime = null,
    Object? chunkSampleTimeTotal = null,
  }) {
    return _then(_$RealtimeAudioClearQueueChunkDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sampleRate: null == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as double,
      sampleTime: null == sampleTime
          ? _value.sampleTime
          : sampleTime // ignore: cast_nullable_to_non_nullable
              as int,
      sampleTimeTotal: null == sampleTimeTotal
          ? _value.sampleTimeTotal
          : sampleTimeTotal // ignore: cast_nullable_to_non_nullable
              as int,
      chunkSampleTime: null == chunkSampleTime
          ? _value.chunkSampleTime
          : chunkSampleTime // ignore: cast_nullable_to_non_nullable
              as int,
      chunkSampleTimeTotal: null == chunkSampleTimeTotal
          ? _value.chunkSampleTimeTotal
          : chunkSampleTimeTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioClearQueueChunkDataImpl
    extends _RealtimeAudioClearQueueChunkData {
  _$RealtimeAudioClearQueueChunkDataImpl(
      {required this.id,
      required this.sampleRate,
      required this.sampleTime,
      required this.sampleTimeTotal,
      required this.chunkSampleTime,
      required this.chunkSampleTimeTotal})
      : super._();

  factory _$RealtimeAudioClearQueueChunkDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RealtimeAudioClearQueueChunkDataImplFromJson(json);

  @override
  final String id;
  @override
  final double sampleRate;
  @override
  final int sampleTime;
  @override
  final int sampleTimeTotal;
  @override
  final int chunkSampleTime;
  @override
  final int chunkSampleTimeTotal;

  @override
  String toString() {
    return 'RealtimeAudioClearQueueChunkData(id: $id, sampleRate: $sampleRate, sampleTime: $sampleTime, sampleTimeTotal: $sampleTimeTotal, chunkSampleTime: $chunkSampleTime, chunkSampleTimeTotal: $chunkSampleTimeTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioClearQueueChunkDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sampleRate, sampleRate) ||
                other.sampleRate == sampleRate) &&
            (identical(other.sampleTime, sampleTime) ||
                other.sampleTime == sampleTime) &&
            (identical(other.sampleTimeTotal, sampleTimeTotal) ||
                other.sampleTimeTotal == sampleTimeTotal) &&
            (identical(other.chunkSampleTime, chunkSampleTime) ||
                other.chunkSampleTime == chunkSampleTime) &&
            (identical(other.chunkSampleTimeTotal, chunkSampleTimeTotal) ||
                other.chunkSampleTimeTotal == chunkSampleTimeTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sampleRate, sampleTime,
      sampleTimeTotal, chunkSampleTime, chunkSampleTimeTotal);

  /// Create a copy of RealtimeAudioClearQueueChunkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioClearQueueChunkDataImplCopyWith<
          _$RealtimeAudioClearQueueChunkDataImpl>
      get copyWith => __$$RealtimeAudioClearQueueChunkDataImplCopyWithImpl<
          _$RealtimeAudioClearQueueChunkDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeAudioClearQueueChunkDataImplToJson(
      this,
    );
  }
}

abstract class _RealtimeAudioClearQueueChunkData
    extends RealtimeAudioClearQueueChunkData {
  factory _RealtimeAudioClearQueueChunkData(
          {required final String id,
          required final double sampleRate,
          required final int sampleTime,
          required final int sampleTimeTotal,
          required final int chunkSampleTime,
          required final int chunkSampleTimeTotal}) =
      _$RealtimeAudioClearQueueChunkDataImpl;
  _RealtimeAudioClearQueueChunkData._() : super._();

  factory _RealtimeAudioClearQueueChunkData.fromJson(
          Map<String, dynamic> json) =
      _$RealtimeAudioClearQueueChunkDataImpl.fromJson;

  @override
  String get id;
  @override
  double get sampleRate;
  @override
  int get sampleTime;
  @override
  int get sampleTimeTotal;
  @override
  int get chunkSampleTime;
  @override
  int get chunkSampleTimeTotal;

  /// Create a copy of RealtimeAudioClearQueueChunkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioClearQueueChunkDataImplCopyWith<
          _$RealtimeAudioClearQueueChunkDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
