import 'package:freezed_annotation/freezed_annotation.dart';

part 'realtime_audio_state.freezed.dart';
part 'realtime_audio_state.g.dart';

@freezed
class RealtimeAudioState with _$RealtimeAudioState {
  const factory RealtimeAudioState({
    @Default(false) bool isPlaying,
    @Default(false) bool isPaused,
    //
    @Default(0) int duration,
    @Default(0) int durationTotal,
    //
    @Default(0) int chunkCount,
  }) = _RealtimeAudioState;

  factory RealtimeAudioState.fromJson(Map<String, dynamic> json) => _$RealtimeAudioStateFromJson(json);
}
