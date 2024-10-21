import 'package:json_annotation/json_annotation.dart';

class DurationMsConverter implements JsonConverter<Duration, int> {
  const DurationMsConverter();

  @override
  Duration fromJson(int milliseconds) {
    return Duration(milliseconds: milliseconds);
  }

  @override
  int toJson(Duration duration) {
    return duration.inMilliseconds;
  }
}
