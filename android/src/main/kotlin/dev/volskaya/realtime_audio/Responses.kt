package dev.volskaya.realtime_audio

data class CreateResponse(
  val id: String
) : FlutterResponse() {
  fun toMap(): Map<String, Any> {
    return mapOf("id" to id)
  }
}

class DestroyResponse() : FlutterResponse() {
  fun toMap(): Map<String, Any> {
    return mapOf()
  }
}

data class GetRecorderPermissionResponse(
  val permission: RealtimeAudioRecorderPermission
) : FlutterResponse() {
  fun toMap(): Map<String, Any> {
    return mapOf("permission" to permission.name)
  }
}

data class RequestRecorderPermissionResponse(
  val permission: RealtimeAudioRecorderPermission
) : FlutterResponse() {
  fun toMap(): Map<String, Any> {
    return mapOf("permission" to permission.name)
  }
}