import 'package:freezed_annotation/freezed_annotation.dart';

part 'realtime_audio_queue_entry.freezed.dart';

@freezed
class RealtimeAudioQueueEntry with _$RealtimeAudioQueueEntry {
  const factory RealtimeAudioQueueEntry.chunk({
    required String id,
  }) = _RealtimeAudioQueueEntryChunk;

  const factory RealtimeAudioQueueEntry.callback({
    required void Function() callback,
  }) = _RealtimeAudioQueueEntryCallback;
}
