// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RealtimeAudioState {

 bool get isPlaying; bool get isPaused;//
 int get duration; int get durationTotal;//
 int get chunkCount;
/// Create a copy of RealtimeAudioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeAudioStateCopyWith<RealtimeAudioState> get copyWith => _$RealtimeAudioStateCopyWithImpl<RealtimeAudioState>(this as RealtimeAudioState, _$identity);

  /// Serializes this RealtimeAudioState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.durationTotal, durationTotal) || other.durationTotal == durationTotal)&&(identical(other.chunkCount, chunkCount) || other.chunkCount == chunkCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPlaying,isPaused,duration,durationTotal,chunkCount);

@override
String toString() {
  return 'RealtimeAudioState(isPlaying: $isPlaying, isPaused: $isPaused, duration: $duration, durationTotal: $durationTotal, chunkCount: $chunkCount)';
}


}

/// @nodoc
abstract mixin class $RealtimeAudioStateCopyWith<$Res>  {
  factory $RealtimeAudioStateCopyWith(RealtimeAudioState value, $Res Function(RealtimeAudioState) _then) = _$RealtimeAudioStateCopyWithImpl;
@useResult
$Res call({
 bool isPlaying, bool isPaused, int duration, int durationTotal, int chunkCount
});




}
/// @nodoc
class _$RealtimeAudioStateCopyWithImpl<$Res>
    implements $RealtimeAudioStateCopyWith<$Res> {
  _$RealtimeAudioStateCopyWithImpl(this._self, this._then);

  final RealtimeAudioState _self;
  final $Res Function(RealtimeAudioState) _then;

/// Create a copy of RealtimeAudioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPlaying = null,Object? isPaused = null,Object? duration = null,Object? durationTotal = null,Object? chunkCount = null,}) {
  return _then(_self.copyWith(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,durationTotal: null == durationTotal ? _self.durationTotal : durationTotal // ignore: cast_nullable_to_non_nullable
as int,chunkCount: null == chunkCount ? _self.chunkCount : chunkCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RealtimeAudioState].
extension RealtimeAudioStatePatterns on RealtimeAudioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealtimeAudioState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeAudioState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealtimeAudioState value)  $default,){
final _that = this;
switch (_that) {
case _RealtimeAudioState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealtimeAudioState value)?  $default,){
final _that = this;
switch (_that) {
case _RealtimeAudioState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPlaying,  bool isPaused,  int duration,  int durationTotal,  int chunkCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeAudioState() when $default != null:
return $default(_that.isPlaying,_that.isPaused,_that.duration,_that.durationTotal,_that.chunkCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPlaying,  bool isPaused,  int duration,  int durationTotal,  int chunkCount)  $default,) {final _that = this;
switch (_that) {
case _RealtimeAudioState():
return $default(_that.isPlaying,_that.isPaused,_that.duration,_that.durationTotal,_that.chunkCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPlaying,  bool isPaused,  int duration,  int durationTotal,  int chunkCount)?  $default,) {final _that = this;
switch (_that) {
case _RealtimeAudioState() when $default != null:
return $default(_that.isPlaying,_that.isPaused,_that.duration,_that.durationTotal,_that.chunkCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RealtimeAudioState implements RealtimeAudioState {
  const _RealtimeAudioState({this.isPlaying = false, this.isPaused = false, this.duration = 0, this.durationTotal = 0, this.chunkCount = 0});
  factory _RealtimeAudioState.fromJson(Map<String, dynamic> json) => _$RealtimeAudioStateFromJson(json);

@override@JsonKey() final  bool isPlaying;
@override@JsonKey() final  bool isPaused;
//
@override@JsonKey() final  int duration;
@override@JsonKey() final  int durationTotal;
//
@override@JsonKey() final  int chunkCount;

/// Create a copy of RealtimeAudioState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeAudioStateCopyWith<_RealtimeAudioState> get copyWith => __$RealtimeAudioStateCopyWithImpl<_RealtimeAudioState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeAudioState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.durationTotal, durationTotal) || other.durationTotal == durationTotal)&&(identical(other.chunkCount, chunkCount) || other.chunkCount == chunkCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPlaying,isPaused,duration,durationTotal,chunkCount);

@override
String toString() {
  return 'RealtimeAudioState(isPlaying: $isPlaying, isPaused: $isPaused, duration: $duration, durationTotal: $durationTotal, chunkCount: $chunkCount)';
}


}

/// @nodoc
abstract mixin class _$RealtimeAudioStateCopyWith<$Res> implements $RealtimeAudioStateCopyWith<$Res> {
  factory _$RealtimeAudioStateCopyWith(_RealtimeAudioState value, $Res Function(_RealtimeAudioState) _then) = __$RealtimeAudioStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPlaying, bool isPaused, int duration, int durationTotal, int chunkCount
});




}
/// @nodoc
class __$RealtimeAudioStateCopyWithImpl<$Res>
    implements _$RealtimeAudioStateCopyWith<$Res> {
  __$RealtimeAudioStateCopyWithImpl(this._self, this._then);

  final _RealtimeAudioState _self;
  final $Res Function(_RealtimeAudioState) _then;

/// Create a copy of RealtimeAudioState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,Object? isPaused = null,Object? duration = null,Object? durationTotal = null,Object? chunkCount = null,}) {
  return _then(_RealtimeAudioState(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,durationTotal: null == durationTotal ? _self.durationTotal : durationTotal // ignore: cast_nullable_to_non_nullable
as int,chunkCount: null == chunkCount ? _self.chunkCount : chunkCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
