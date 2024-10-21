import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtime_audio/src/data/other.dart';

part 'realtime_audio_response.freezed.dart';
part 'realtime_audio_response.g.dart';

@freezed
class RealtimeAudioResponse with _$RealtimeAudioResponse {
  const factory RealtimeAudioResponse.create({
    required String id,
  }) = RealtimeAudioResponseCreate;

  const factory RealtimeAudioResponse.destroy() = RealtimeAudioResponseDestroy;

  const factory RealtimeAudioResponse.getRecordPermission({
    required RealtimeAudioRecordPermission permission,
  }) = RealtimeAudioResponseGetRecordPermission;

  const factory RealtimeAudioResponse.requestRecordPermission({
    required RealtimeAudioRecordPermission permission,
  }) = RealtimeAudioResponseRequestRecordPermission;
  //

  factory RealtimeAudioResponse.fromJson(Map<String, dynamic> json) => _$RealtimeAudioResponseFromJson(json);
}
