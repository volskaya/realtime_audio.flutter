struct CreateResponse: FlutterResponse {
  var id: String
}

struct DestroyResponse: FlutterResponse {

}

struct GetRecordPermissionResponse: FlutterResponse {
  var permission: RealtimeAudioRecordPermission
}

struct RequestRecordPermissionResponse: FlutterResponse {
  var permission: RealtimeAudioRecordPermission
}
