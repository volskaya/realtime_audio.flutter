// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_queue_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RealtimeAudioQueueEntry {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioQueueEntry);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RealtimeAudioQueueEntry()';
}


}

/// @nodoc
class $RealtimeAudioQueueEntryCopyWith<$Res>  {
$RealtimeAudioQueueEntryCopyWith(RealtimeAudioQueueEntry _, $Res Function(RealtimeAudioQueueEntry) __);
}


/// Adds pattern-matching-related methods to [RealtimeAudioQueueEntry].
extension RealtimeAudioQueueEntryPatterns on RealtimeAudioQueueEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RealtimeAudioQueueEntryChunk value)?  chunk,TResult Function( _RealtimeAudioQueueEntryCallback value)?  callback,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeAudioQueueEntryChunk() when chunk != null:
return chunk(_that);case _RealtimeAudioQueueEntryCallback() when callback != null:
return callback(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RealtimeAudioQueueEntryChunk value)  chunk,required TResult Function( _RealtimeAudioQueueEntryCallback value)  callback,}){
final _that = this;
switch (_that) {
case _RealtimeAudioQueueEntryChunk():
return chunk(_that);case _RealtimeAudioQueueEntryCallback():
return callback(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RealtimeAudioQueueEntryChunk value)?  chunk,TResult? Function( _RealtimeAudioQueueEntryCallback value)?  callback,}){
final _that = this;
switch (_that) {
case _RealtimeAudioQueueEntryChunk() when chunk != null:
return chunk(_that);case _RealtimeAudioQueueEntryCallback() when callback != null:
return callback(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id)?  chunk,TResult Function( void Function() callback)?  callback,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeAudioQueueEntryChunk() when chunk != null:
return chunk(_that.id);case _RealtimeAudioQueueEntryCallback() when callback != null:
return callback(_that.callback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id)  chunk,required TResult Function( void Function() callback)  callback,}) {final _that = this;
switch (_that) {
case _RealtimeAudioQueueEntryChunk():
return chunk(_that.id);case _RealtimeAudioQueueEntryCallback():
return callback(_that.callback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id)?  chunk,TResult? Function( void Function() callback)?  callback,}) {final _that = this;
switch (_that) {
case _RealtimeAudioQueueEntryChunk() when chunk != null:
return chunk(_that.id);case _RealtimeAudioQueueEntryCallback() when callback != null:
return callback(_that.callback);case _:
  return null;

}
}

}

/// @nodoc


class _RealtimeAudioQueueEntryChunk implements RealtimeAudioQueueEntry {
  const _RealtimeAudioQueueEntryChunk({required this.id});
  

 final  String id;

/// Create a copy of RealtimeAudioQueueEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeAudioQueueEntryChunkCopyWith<_RealtimeAudioQueueEntryChunk> get copyWith => __$RealtimeAudioQueueEntryChunkCopyWithImpl<_RealtimeAudioQueueEntryChunk>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeAudioQueueEntryChunk&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'RealtimeAudioQueueEntry.chunk(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RealtimeAudioQueueEntryChunkCopyWith<$Res> implements $RealtimeAudioQueueEntryCopyWith<$Res> {
  factory _$RealtimeAudioQueueEntryChunkCopyWith(_RealtimeAudioQueueEntryChunk value, $Res Function(_RealtimeAudioQueueEntryChunk) _then) = __$RealtimeAudioQueueEntryChunkCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$RealtimeAudioQueueEntryChunkCopyWithImpl<$Res>
    implements _$RealtimeAudioQueueEntryChunkCopyWith<$Res> {
  __$RealtimeAudioQueueEntryChunkCopyWithImpl(this._self, this._then);

  final _RealtimeAudioQueueEntryChunk _self;
  final $Res Function(_RealtimeAudioQueueEntryChunk) _then;

/// Create a copy of RealtimeAudioQueueEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_RealtimeAudioQueueEntryChunk(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RealtimeAudioQueueEntryCallback implements RealtimeAudioQueueEntry {
  const _RealtimeAudioQueueEntryCallback({required this.callback});
  

 final  void Function() callback;

/// Create a copy of RealtimeAudioQueueEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeAudioQueueEntryCallbackCopyWith<_RealtimeAudioQueueEntryCallback> get copyWith => __$RealtimeAudioQueueEntryCallbackCopyWithImpl<_RealtimeAudioQueueEntryCallback>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeAudioQueueEntryCallback&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,callback);

@override
String toString() {
  return 'RealtimeAudioQueueEntry.callback(callback: $callback)';
}


}

/// @nodoc
abstract mixin class _$RealtimeAudioQueueEntryCallbackCopyWith<$Res> implements $RealtimeAudioQueueEntryCopyWith<$Res> {
  factory _$RealtimeAudioQueueEntryCallbackCopyWith(_RealtimeAudioQueueEntryCallback value, $Res Function(_RealtimeAudioQueueEntryCallback) _then) = __$RealtimeAudioQueueEntryCallbackCopyWithImpl;
@useResult
$Res call({
 void Function() callback
});




}
/// @nodoc
class __$RealtimeAudioQueueEntryCallbackCopyWithImpl<$Res>
    implements _$RealtimeAudioQueueEntryCallbackCopyWith<$Res> {
  __$RealtimeAudioQueueEntryCallbackCopyWithImpl(this._self, this._then);

  final _RealtimeAudioQueueEntryCallback _self;
  final $Res Function(_RealtimeAudioQueueEntryCallback) _then;

/// Create a copy of RealtimeAudioQueueEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? callback = null,}) {
  return _then(_RealtimeAudioQueueEntryCallback(
callback: null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as void Function(),
  ));
}


}

// dart format on
