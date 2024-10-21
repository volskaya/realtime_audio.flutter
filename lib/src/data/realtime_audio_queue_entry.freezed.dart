// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_queue_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RealtimeAudioQueueEntry {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) chunk,
    required TResult Function(void Function() callback) callback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? chunk,
    TResult? Function(void Function() callback)? callback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? chunk,
    TResult Function(void Function() callback)? callback,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealtimeAudioQueueEntryChunk value) chunk,
    required TResult Function(_RealtimeAudioQueueEntryCallback value) callback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealtimeAudioQueueEntryChunk value)? chunk,
    TResult? Function(_RealtimeAudioQueueEntryCallback value)? callback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealtimeAudioQueueEntryChunk value)? chunk,
    TResult Function(_RealtimeAudioQueueEntryCallback value)? callback,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeAudioQueueEntryCopyWith<$Res> {
  factory $RealtimeAudioQueueEntryCopyWith(RealtimeAudioQueueEntry value,
          $Res Function(RealtimeAudioQueueEntry) then) =
      _$RealtimeAudioQueueEntryCopyWithImpl<$Res, RealtimeAudioQueueEntry>;
}

/// @nodoc
class _$RealtimeAudioQueueEntryCopyWithImpl<$Res,
        $Val extends RealtimeAudioQueueEntry>
    implements $RealtimeAudioQueueEntryCopyWith<$Res> {
  _$RealtimeAudioQueueEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeAudioQueueEntry
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RealtimeAudioQueueEntryChunkImplCopyWith<$Res> {
  factory _$$RealtimeAudioQueueEntryChunkImplCopyWith(
          _$RealtimeAudioQueueEntryChunkImpl value,
          $Res Function(_$RealtimeAudioQueueEntryChunkImpl) then) =
      __$$RealtimeAudioQueueEntryChunkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RealtimeAudioQueueEntryChunkImplCopyWithImpl<$Res>
    extends _$RealtimeAudioQueueEntryCopyWithImpl<$Res,
        _$RealtimeAudioQueueEntryChunkImpl>
    implements _$$RealtimeAudioQueueEntryChunkImplCopyWith<$Res> {
  __$$RealtimeAudioQueueEntryChunkImplCopyWithImpl(
      _$RealtimeAudioQueueEntryChunkImpl _value,
      $Res Function(_$RealtimeAudioQueueEntryChunkImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioQueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RealtimeAudioQueueEntryChunkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RealtimeAudioQueueEntryChunkImpl
    implements _RealtimeAudioQueueEntryChunk {
  const _$RealtimeAudioQueueEntryChunkImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'RealtimeAudioQueueEntry.chunk(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioQueueEntryChunkImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RealtimeAudioQueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioQueueEntryChunkImplCopyWith<
          _$RealtimeAudioQueueEntryChunkImpl>
      get copyWith => __$$RealtimeAudioQueueEntryChunkImplCopyWithImpl<
          _$RealtimeAudioQueueEntryChunkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) chunk,
    required TResult Function(void Function() callback) callback,
  }) {
    return chunk(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? chunk,
    TResult? Function(void Function() callback)? callback,
  }) {
    return chunk?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? chunk,
    TResult Function(void Function() callback)? callback,
    required TResult orElse(),
  }) {
    if (chunk != null) {
      return chunk(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealtimeAudioQueueEntryChunk value) chunk,
    required TResult Function(_RealtimeAudioQueueEntryCallback value) callback,
  }) {
    return chunk(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealtimeAudioQueueEntryChunk value)? chunk,
    TResult? Function(_RealtimeAudioQueueEntryCallback value)? callback,
  }) {
    return chunk?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealtimeAudioQueueEntryChunk value)? chunk,
    TResult Function(_RealtimeAudioQueueEntryCallback value)? callback,
    required TResult orElse(),
  }) {
    if (chunk != null) {
      return chunk(this);
    }
    return orElse();
  }
}

abstract class _RealtimeAudioQueueEntryChunk
    implements RealtimeAudioQueueEntry {
  const factory _RealtimeAudioQueueEntryChunk({required final String id}) =
      _$RealtimeAudioQueueEntryChunkImpl;

  String get id;

  /// Create a copy of RealtimeAudioQueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioQueueEntryChunkImplCopyWith<
          _$RealtimeAudioQueueEntryChunkImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RealtimeAudioQueueEntryCallbackImplCopyWith<$Res> {
  factory _$$RealtimeAudioQueueEntryCallbackImplCopyWith(
          _$RealtimeAudioQueueEntryCallbackImpl value,
          $Res Function(_$RealtimeAudioQueueEntryCallbackImpl) then) =
      __$$RealtimeAudioQueueEntryCallbackImplCopyWithImpl<$Res>;
  @useResult
  $Res call({void Function() callback});
}

/// @nodoc
class __$$RealtimeAudioQueueEntryCallbackImplCopyWithImpl<$Res>
    extends _$RealtimeAudioQueueEntryCopyWithImpl<$Res,
        _$RealtimeAudioQueueEntryCallbackImpl>
    implements _$$RealtimeAudioQueueEntryCallbackImplCopyWith<$Res> {
  __$$RealtimeAudioQueueEntryCallbackImplCopyWithImpl(
      _$RealtimeAudioQueueEntryCallbackImpl _value,
      $Res Function(_$RealtimeAudioQueueEntryCallbackImpl) _then)
      : super(_value, _then);

  /// Create a copy of RealtimeAudioQueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callback = null,
  }) {
    return _then(_$RealtimeAudioQueueEntryCallbackImpl(
      callback: null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc

class _$RealtimeAudioQueueEntryCallbackImpl
    implements _RealtimeAudioQueueEntryCallback {
  const _$RealtimeAudioQueueEntryCallbackImpl({required this.callback});

  @override
  final void Function() callback;

  @override
  String toString() {
    return 'RealtimeAudioQueueEntry.callback(callback: $callback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeAudioQueueEntryCallbackImpl &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, callback);

  /// Create a copy of RealtimeAudioQueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeAudioQueueEntryCallbackImplCopyWith<
          _$RealtimeAudioQueueEntryCallbackImpl>
      get copyWith => __$$RealtimeAudioQueueEntryCallbackImplCopyWithImpl<
          _$RealtimeAudioQueueEntryCallbackImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) chunk,
    required TResult Function(void Function() callback) callback,
  }) {
    return callback(this.callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? chunk,
    TResult? Function(void Function() callback)? callback,
  }) {
    return callback?.call(this.callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? chunk,
    TResult Function(void Function() callback)? callback,
    required TResult orElse(),
  }) {
    if (callback != null) {
      return callback(this.callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RealtimeAudioQueueEntryChunk value) chunk,
    required TResult Function(_RealtimeAudioQueueEntryCallback value) callback,
  }) {
    return callback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RealtimeAudioQueueEntryChunk value)? chunk,
    TResult? Function(_RealtimeAudioQueueEntryCallback value)? callback,
  }) {
    return callback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RealtimeAudioQueueEntryChunk value)? chunk,
    TResult Function(_RealtimeAudioQueueEntryCallback value)? callback,
    required TResult orElse(),
  }) {
    if (callback != null) {
      return callback(this);
    }
    return orElse();
  }
}

abstract class _RealtimeAudioQueueEntryCallback
    implements RealtimeAudioQueueEntry {
  const factory _RealtimeAudioQueueEntryCallback(
          {required final void Function() callback}) =
      _$RealtimeAudioQueueEntryCallbackImpl;

  void Function() get callback;

  /// Create a copy of RealtimeAudioQueueEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeAudioQueueEntryCallbackImplCopyWith<
          _$RealtimeAudioQueueEntryCallbackImpl>
      get copyWith => throw _privateConstructorUsedError;
}
