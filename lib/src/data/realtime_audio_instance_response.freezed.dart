// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_audio_instance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
RealtimeAudioInstanceResponse _$RealtimeAudioInstanceResponseFromJson(
  Map<String, dynamic> json
) {
    return RealtimeAudioInstanceResponseClearQueue.fromJson(
      json
    );
}

/// @nodoc
mixin _$RealtimeAudioInstanceResponse {

 RealtimeAudioClearQueueChunkData? get chunk;
/// Create a copy of RealtimeAudioInstanceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeAudioInstanceResponseCopyWith<RealtimeAudioInstanceResponse> get copyWith => _$RealtimeAudioInstanceResponseCopyWithImpl<RealtimeAudioInstanceResponse>(this as RealtimeAudioInstanceResponse, _$identity);

  /// Serializes this RealtimeAudioInstanceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioInstanceResponse&&(identical(other.chunk, chunk) || other.chunk == chunk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chunk);

@override
String toString() {
  return 'RealtimeAudioInstanceResponse(chunk: $chunk)';
}


}

/// @nodoc
abstract mixin class $RealtimeAudioInstanceResponseCopyWith<$Res>  {
  factory $RealtimeAudioInstanceResponseCopyWith(RealtimeAudioInstanceResponse value, $Res Function(RealtimeAudioInstanceResponse) _then) = _$RealtimeAudioInstanceResponseCopyWithImpl;
@useResult
$Res call({
 RealtimeAudioClearQueueChunkData? chunk
});


$RealtimeAudioClearQueueChunkDataCopyWith<$Res>? get chunk;

}
/// @nodoc
class _$RealtimeAudioInstanceResponseCopyWithImpl<$Res>
    implements $RealtimeAudioInstanceResponseCopyWith<$Res> {
  _$RealtimeAudioInstanceResponseCopyWithImpl(this._self, this._then);

  final RealtimeAudioInstanceResponse _self;
  final $Res Function(RealtimeAudioInstanceResponse) _then;

/// Create a copy of RealtimeAudioInstanceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chunk = freezed,}) {
  return _then(_self.copyWith(
chunk: freezed == chunk ? _self.chunk : chunk // ignore: cast_nullable_to_non_nullable
as RealtimeAudioClearQueueChunkData?,
  ));
}
/// Create a copy of RealtimeAudioInstanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RealtimeAudioClearQueueChunkDataCopyWith<$Res>? get chunk {
    if (_self.chunk == null) {
    return null;
  }

  return $RealtimeAudioClearQueueChunkDataCopyWith<$Res>(_self.chunk!, (value) {
    return _then(_self.copyWith(chunk: value));
  });
}
}


/// Adds pattern-matching-related methods to [RealtimeAudioInstanceResponse].
extension RealtimeAudioInstanceResponsePatterns on RealtimeAudioInstanceResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RealtimeAudioInstanceResponseClearQueue value)?  clearQueue,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RealtimeAudioInstanceResponseClearQueue() when clearQueue != null:
return clearQueue(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RealtimeAudioInstanceResponseClearQueue value)  clearQueue,}){
final _that = this;
switch (_that) {
case RealtimeAudioInstanceResponseClearQueue():
return clearQueue(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RealtimeAudioInstanceResponseClearQueue value)?  clearQueue,}){
final _that = this;
switch (_that) {
case RealtimeAudioInstanceResponseClearQueue() when clearQueue != null:
return clearQueue(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RealtimeAudioClearQueueChunkData? chunk)?  clearQueue,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RealtimeAudioInstanceResponseClearQueue() when clearQueue != null:
return clearQueue(_that.chunk);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RealtimeAudioClearQueueChunkData? chunk)  clearQueue,}) {final _that = this;
switch (_that) {
case RealtimeAudioInstanceResponseClearQueue():
return clearQueue(_that.chunk);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RealtimeAudioClearQueueChunkData? chunk)?  clearQueue,}) {final _that = this;
switch (_that) {
case RealtimeAudioInstanceResponseClearQueue() when clearQueue != null:
return clearQueue(_that.chunk);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RealtimeAudioInstanceResponseClearQueue implements RealtimeAudioInstanceResponse {
  const RealtimeAudioInstanceResponseClearQueue({this.chunk});
  factory RealtimeAudioInstanceResponseClearQueue.fromJson(Map<String, dynamic> json) => _$RealtimeAudioInstanceResponseClearQueueFromJson(json);

@override final  RealtimeAudioClearQueueChunkData? chunk;

/// Create a copy of RealtimeAudioInstanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeAudioInstanceResponseClearQueueCopyWith<RealtimeAudioInstanceResponseClearQueue> get copyWith => _$RealtimeAudioInstanceResponseClearQueueCopyWithImpl<RealtimeAudioInstanceResponseClearQueue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioInstanceResponseClearQueueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioInstanceResponseClearQueue&&(identical(other.chunk, chunk) || other.chunk == chunk));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chunk);

@override
String toString() {
  return 'RealtimeAudioInstanceResponse.clearQueue(chunk: $chunk)';
}


}

/// @nodoc
abstract mixin class $RealtimeAudioInstanceResponseClearQueueCopyWith<$Res> implements $RealtimeAudioInstanceResponseCopyWith<$Res> {
  factory $RealtimeAudioInstanceResponseClearQueueCopyWith(RealtimeAudioInstanceResponseClearQueue value, $Res Function(RealtimeAudioInstanceResponseClearQueue) _then) = _$RealtimeAudioInstanceResponseClearQueueCopyWithImpl;
@override @useResult
$Res call({
 RealtimeAudioClearQueueChunkData? chunk
});


@override $RealtimeAudioClearQueueChunkDataCopyWith<$Res>? get chunk;

}
/// @nodoc
class _$RealtimeAudioInstanceResponseClearQueueCopyWithImpl<$Res>
    implements $RealtimeAudioInstanceResponseClearQueueCopyWith<$Res> {
  _$RealtimeAudioInstanceResponseClearQueueCopyWithImpl(this._self, this._then);

  final RealtimeAudioInstanceResponseClearQueue _self;
  final $Res Function(RealtimeAudioInstanceResponseClearQueue) _then;

/// Create a copy of RealtimeAudioInstanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chunk = freezed,}) {
  return _then(RealtimeAudioInstanceResponseClearQueue(
chunk: freezed == chunk ? _self.chunk : chunk // ignore: cast_nullable_to_non_nullable
as RealtimeAudioClearQueueChunkData?,
  ));
}

/// Create a copy of RealtimeAudioInstanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RealtimeAudioClearQueueChunkDataCopyWith<$Res>? get chunk {
    if (_self.chunk == null) {
    return null;
  }

  return $RealtimeAudioClearQueueChunkDataCopyWith<$Res>(_self.chunk!, (value) {
    return _then(_self.copyWith(chunk: value));
  });
}
}


/// @nodoc
mixin _$RealtimeAudioClearQueueChunkData {

//
 dynamic get chunkElapsed; dynamic get elapsed; String get id; double get sampleRate; int get sampleTime; int get sampleTimeTotal; int get chunkSampleTime; int get chunkSampleTimeTotal;
/// Create a copy of RealtimeAudioClearQueueChunkData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeAudioClearQueueChunkDataCopyWith<RealtimeAudioClearQueueChunkData> get copyWith => _$RealtimeAudioClearQueueChunkDataCopyWithImpl<RealtimeAudioClearQueueChunkData>(this as RealtimeAudioClearQueueChunkData, _$identity);

  /// Serializes this RealtimeAudioClearQueueChunkData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeAudioClearQueueChunkData&&const DeepCollectionEquality().equals(other.chunkElapsed, chunkElapsed)&&const DeepCollectionEquality().equals(other.elapsed, elapsed)&&(identical(other.id, id) || other.id == id)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.sampleTime, sampleTime) || other.sampleTime == sampleTime)&&(identical(other.sampleTimeTotal, sampleTimeTotal) || other.sampleTimeTotal == sampleTimeTotal)&&(identical(other.chunkSampleTime, chunkSampleTime) || other.chunkSampleTime == chunkSampleTime)&&(identical(other.chunkSampleTimeTotal, chunkSampleTimeTotal) || other.chunkSampleTimeTotal == chunkSampleTimeTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chunkElapsed),const DeepCollectionEquality().hash(elapsed),id,sampleRate,sampleTime,sampleTimeTotal,chunkSampleTime,chunkSampleTimeTotal);

@override
String toString() {
  return 'RealtimeAudioClearQueueChunkData(chunkElapsed: $chunkElapsed, elapsed: $elapsed, id: $id, sampleRate: $sampleRate, sampleTime: $sampleTime, sampleTimeTotal: $sampleTimeTotal, chunkSampleTime: $chunkSampleTime, chunkSampleTimeTotal: $chunkSampleTimeTotal)';
}


}

/// @nodoc
abstract mixin class $RealtimeAudioClearQueueChunkDataCopyWith<$Res>  {
  factory $RealtimeAudioClearQueueChunkDataCopyWith(RealtimeAudioClearQueueChunkData value, $Res Function(RealtimeAudioClearQueueChunkData) _then) = _$RealtimeAudioClearQueueChunkDataCopyWithImpl;
@useResult
$Res call({
 String id, double sampleRate, int sampleTime, int sampleTimeTotal, int chunkSampleTime, int chunkSampleTimeTotal
});




}
/// @nodoc
class _$RealtimeAudioClearQueueChunkDataCopyWithImpl<$Res>
    implements $RealtimeAudioClearQueueChunkDataCopyWith<$Res> {
  _$RealtimeAudioClearQueueChunkDataCopyWithImpl(this._self, this._then);

  final RealtimeAudioClearQueueChunkData _self;
  final $Res Function(RealtimeAudioClearQueueChunkData) _then;

/// Create a copy of RealtimeAudioClearQueueChunkData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sampleRate = null,Object? sampleTime = null,Object? sampleTimeTotal = null,Object? chunkSampleTime = null,Object? chunkSampleTimeTotal = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sampleRate: null == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as double,sampleTime: null == sampleTime ? _self.sampleTime : sampleTime // ignore: cast_nullable_to_non_nullable
as int,sampleTimeTotal: null == sampleTimeTotal ? _self.sampleTimeTotal : sampleTimeTotal // ignore: cast_nullable_to_non_nullable
as int,chunkSampleTime: null == chunkSampleTime ? _self.chunkSampleTime : chunkSampleTime // ignore: cast_nullable_to_non_nullable
as int,chunkSampleTimeTotal: null == chunkSampleTimeTotal ? _self.chunkSampleTimeTotal : chunkSampleTimeTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RealtimeAudioClearQueueChunkData].
extension RealtimeAudioClearQueueChunkDataPatterns on RealtimeAudioClearQueueChunkData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealtimeAudioClearQueueChunkData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeAudioClearQueueChunkData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealtimeAudioClearQueueChunkData value)  $default,){
final _that = this;
switch (_that) {
case _RealtimeAudioClearQueueChunkData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealtimeAudioClearQueueChunkData value)?  $default,){
final _that = this;
switch (_that) {
case _RealtimeAudioClearQueueChunkData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double sampleRate,  int sampleTime,  int sampleTimeTotal,  int chunkSampleTime,  int chunkSampleTimeTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeAudioClearQueueChunkData() when $default != null:
return $default(_that.id,_that.sampleRate,_that.sampleTime,_that.sampleTimeTotal,_that.chunkSampleTime,_that.chunkSampleTimeTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double sampleRate,  int sampleTime,  int sampleTimeTotal,  int chunkSampleTime,  int chunkSampleTimeTotal)  $default,) {final _that = this;
switch (_that) {
case _RealtimeAudioClearQueueChunkData():
return $default(_that.id,_that.sampleRate,_that.sampleTime,_that.sampleTimeTotal,_that.chunkSampleTime,_that.chunkSampleTimeTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double sampleRate,  int sampleTime,  int sampleTimeTotal,  int chunkSampleTime,  int chunkSampleTimeTotal)?  $default,) {final _that = this;
switch (_that) {
case _RealtimeAudioClearQueueChunkData() when $default != null:
return $default(_that.id,_that.sampleRate,_that.sampleTime,_that.sampleTimeTotal,_that.chunkSampleTime,_that.chunkSampleTimeTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RealtimeAudioClearQueueChunkData extends RealtimeAudioClearQueueChunkData {
   _RealtimeAudioClearQueueChunkData({required this.id, required this.sampleRate, required this.sampleTime, required this.sampleTimeTotal, required this.chunkSampleTime, required this.chunkSampleTimeTotal}): super._();
  factory _RealtimeAudioClearQueueChunkData.fromJson(Map<String, dynamic> json) => _$RealtimeAudioClearQueueChunkDataFromJson(json);

@override final  String id;
@override final  double sampleRate;
@override final  int sampleTime;
@override final  int sampleTimeTotal;
@override final  int chunkSampleTime;
@override final  int chunkSampleTimeTotal;

/// Create a copy of RealtimeAudioClearQueueChunkData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeAudioClearQueueChunkDataCopyWith<_RealtimeAudioClearQueueChunkData> get copyWith => __$RealtimeAudioClearQueueChunkDataCopyWithImpl<_RealtimeAudioClearQueueChunkData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeAudioClearQueueChunkDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeAudioClearQueueChunkData&&(identical(other.id, id) || other.id == id)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.sampleTime, sampleTime) || other.sampleTime == sampleTime)&&(identical(other.sampleTimeTotal, sampleTimeTotal) || other.sampleTimeTotal == sampleTimeTotal)&&(identical(other.chunkSampleTime, chunkSampleTime) || other.chunkSampleTime == chunkSampleTime)&&(identical(other.chunkSampleTimeTotal, chunkSampleTimeTotal) || other.chunkSampleTimeTotal == chunkSampleTimeTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sampleRate,sampleTime,sampleTimeTotal,chunkSampleTime,chunkSampleTimeTotal);

@override
String toString() {
  return 'RealtimeAudioClearQueueChunkData(id: $id, sampleRate: $sampleRate, sampleTime: $sampleTime, sampleTimeTotal: $sampleTimeTotal, chunkSampleTime: $chunkSampleTime, chunkSampleTimeTotal: $chunkSampleTimeTotal)';
}


}

/// @nodoc
abstract mixin class _$RealtimeAudioClearQueueChunkDataCopyWith<$Res> implements $RealtimeAudioClearQueueChunkDataCopyWith<$Res> {
  factory _$RealtimeAudioClearQueueChunkDataCopyWith(_RealtimeAudioClearQueueChunkData value, $Res Function(_RealtimeAudioClearQueueChunkData) _then) = __$RealtimeAudioClearQueueChunkDataCopyWithImpl;
@override @useResult
$Res call({
 String id, double sampleRate, int sampleTime, int sampleTimeTotal, int chunkSampleTime, int chunkSampleTimeTotal
});




}
/// @nodoc
class __$RealtimeAudioClearQueueChunkDataCopyWithImpl<$Res>
    implements _$RealtimeAudioClearQueueChunkDataCopyWith<$Res> {
  __$RealtimeAudioClearQueueChunkDataCopyWithImpl(this._self, this._then);

  final _RealtimeAudioClearQueueChunkData _self;
  final $Res Function(_RealtimeAudioClearQueueChunkData) _then;

/// Create a copy of RealtimeAudioClearQueueChunkData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sampleRate = null,Object? sampleTime = null,Object? sampleTimeTotal = null,Object? chunkSampleTime = null,Object? chunkSampleTimeTotal = null,}) {
  return _then(_RealtimeAudioClearQueueChunkData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sampleRate: null == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as double,sampleTime: null == sampleTime ? _self.sampleTime : sampleTime // ignore: cast_nullable_to_non_nullable
as int,sampleTimeTotal: null == sampleTimeTotal ? _self.sampleTimeTotal : sampleTimeTotal // ignore: cast_nullable_to_non_nullable
as int,chunkSampleTime: null == chunkSampleTime ? _self.chunkSampleTime : chunkSampleTime // ignore: cast_nullable_to_non_nullable
as int,chunkSampleTimeTotal: null == chunkSampleTimeTotal ? _self.chunkSampleTimeTotal : chunkSampleTimeTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
