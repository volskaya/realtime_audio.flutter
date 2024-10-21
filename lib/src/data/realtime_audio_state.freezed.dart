// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RealtimeAudioState _$RealtimeAudioStateFromJson(Map<String, dynamic> json) {
  return _RealtimeAudioState.fromJson(json);
}

/// @nodoc
mixin _$RealtimeAudioState {
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get isPaused => throw _privateConstructorUsedError;
  bool get isRecording => throw _privateConstructorUsedError; //
  int get duration => throw _privateConstructorUsedError;
  int get durationTotal => throw _privateConstructorUsedError; //
  int get chunkCount => throw _privateConstructorUsedError;

  /// Serializes this RealtimeAudioState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RealtimeAudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealtimeAudioStateCopyWith<RealtimeAudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeAudioStateCopyWith<$Res> {
  factory $RealtimeAudioStateCopyWith(
          RealtimeAudioState value, $Res Function(RealtimeAudioState) then) =
      _$RealtimeAudioStateCopyWithImpl<$Res, RealtimeAudioState>;
  @useResult
  $Res call(
      {bool isPlaying,
      bool isPaused,
      bool isRecording,
      int duration,
      int durationTotal,
      int chunkCount});
}

/// @nodoc
class _$RealtimeAudioStateCopyWithImpl<$Res, $Val extends RealtimeAudioState>
    implements $RealtimeAudioStateCopyWith<$Res> {
  _$RealtimeAudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeAudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? isPaused = null,
    Object? isRecording = null,
    Object? duration = null,
    Object? durationTotal = null,
    Object? chunkCount = null,
  }) {
    return _then(_value.copyWith(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      durationTotal: null == durationTotal
          ? _value.durationTotal
          : durationTotal // ignore: cast_nullable_to_non_nullable
              as int,
      chunkCount: null == chunkCount
          ? _value.chunkCount
          : chunkCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealtimeAudioStateImplCopyWith<$Res>
    implements $RealtimeAudioStateCopyWith<$Res> {
  factory _$$RealtimeAudioStateImplCopyWith(_$RealtimeAudioStateImpl value,
          $Res Function(_$RealtimeAudioStateImpl) then) =
      __$$RealtimeAudioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isPlaying,
      bool isPaused,
      bool isRecording,
      int duration,
      int durationTotal,
      int chunkCount});
}

/// @nodoc
class __$$RealtimeAudioStateImplCopyWithImpl<$Res>
    extends _$RealtimeAudioStateCopyWithImpl<$Res, _$RealtimeAudioStateImpl>
    implements _$$RealtimeAudioStateImplCopyWith<$Res> {
  __$$RealtimeAudioStateImplCopyWithImpl(_$RealtimeAudioStateImpl _value,
      $Res Function(_$RealtimeAudioStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? isPaused = null,
    Object? isRecording = null,
    Object? duration = null,
    Object? durationTotal = null,
    Object? chunkCount = null,
  }) {
    return _then(_$RealtimeAudioStateImpl(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      durationTotal: null == durationTotal
          ? _value.durationTotal
          : durationTotal // ignore: cast_nullable_to_non_nullable
              as int,
      chunkCount: null == chunkCount
          ? _value.chunkCount
          : chunkCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeAudioStateImpl implements _RealtimeAudioState {
  const _$RealtimeAudioStateImpl(
      {this.isPlaying = false,
      this.isPaused = false,
      this.isRecording = false,
      this.duration = 0,
      this.durationTotal = 0,
      this.chunkCount = 0});

  factory _$RealtimeAudioStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealtimeAudioStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final bool isPaused;
  @override
  @JsonKey()
  final bool isRecording;
//
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final int durationTotal;
//
  @override
  @JsonKey()
  final int chunkCount;

  @override
  String toString() {
    return 'RealtimeAudioState(isPlaying: $isPlaying, isPaused: $isPaused, isRecording: $isRecording, duration: $duration, durationTotal: $durationTotal, chunkCount: $chunkCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioStateImpl &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.durationTotal, durationTotal) ||
                other.durationTotal == durationTotal) &&
            (identical(other.chunkCount, chunkCount) ||
                other.chunkCount == chunkCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isPlaying, isPaused, isRecording,
      duration, durationTotal, chunkCount);

  /// Create a copy of RealtimeAudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioStateImplCopyWith<_$RealtimeAudioStateImpl> get copyWith =>
      __$$RealtimeAudioStateImplCopyWithImpl<_$RealtimeAudioStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeAudioStateImplToJson(
      this,
    );
  }
}

abstract class _RealtimeAudioState implements RealtimeAudioState {
  const factory _RealtimeAudioState(
      {final bool isPlaying,
      final bool isPaused,
      final bool isRecording,
      final int duration,
      final int durationTotal,
      final int chunkCount}) = _$RealtimeAudioStateImpl;

  factory _RealtimeAudioState.fromJson(Map<String, dynamic> json) =
      _$RealtimeAudioStateImpl.fromJson;

  @override
  bool get isPlaying;
  @override
  bool get isPaused;
  @override
  bool get isRecording; //
  @override
  int get duration;
  @override
  int get durationTotal; //
  @override
  int get chunkCount;

  /// Create a copy of RealtimeAudioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioStateImplCopyWith<_$RealtimeAudioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
