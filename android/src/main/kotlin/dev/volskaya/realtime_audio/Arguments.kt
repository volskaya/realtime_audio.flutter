package dev.volskaya.realtime_audio

import io.flutter.plugin.common.MethodCall

data class CreateArguments(
  val isFirstCreate: Boolean,
  val voiceProcessing: Boolean,
  val recorderEnabled: Boolean,
  val playerSampleRate: Int,
  val recorderSampleRate: Int,
  val playerProgressInterval: Long,
  val playerVolumeInterval: Long,
  val recorderChunkInterval: Long,
) : FlutterArguments() {
  companion object {
    fun fromMethodCall(call: MethodCall): CreateArguments {
      return CreateArguments(
        isFirstCreate = call.argument<Boolean>("isFirstCreate") ?: throw Error("Missing isFirstCreate."),
        voiceProcessing = call.argument<Boolean>("voiceProcessing") ?: throw Error("Missing voiceProcessing."),
        recorderEnabled = call.argument<Boolean>("recorderEnabled") ?: throw Error("Missing recorderEnabled."),
        playerSampleRate = call.argument<Int>("playerSampleRate") ?: throw Error("Missing playerSampleRate."),
        recorderSampleRate = call.argument<Int>("recorderSampleRate") ?: throw Error("Missing recorderSampleRate."),
        playerProgressInterval = call.argument<Int>("playerProgressInterval")?.toLong()
          ?: throw Error("Missing playerProgressInterval."),
        playerVolumeInterval = call.argument<Int>("playerVolumeInterval")?.toLong()
          ?: throw Error("Missing playerVolumeInterval."),
        recorderChunkInterval = call.argument<Int>("recorderChunkInterval")?.toLong()
          ?: throw Error("Missing recorderChunkInterval."),
      )
    }
  }
}

data class DestroyArguments(
  val id: String
) : FlutterArguments() {
  companion object {
    fun fromMethodCall(call: MethodCall): DestroyArguments {
      return DestroyArguments(
        id = call.argument<String>("id") ?: throw Error("Missing id.")
      )
    }
  }
}

class GetRecorderPermissionArguments : FlutterArguments() {
  companion object {
    fun fromMethodCall(call: MethodCall): GetRecorderPermissionArguments {
      return GetRecorderPermissionArguments()
    }
  }
}


class RequestRecorderPermissionArguments : FlutterArguments() {
  companion object {
    fun fromMethodCall(call: MethodCall): RequestRecorderPermissionArguments {
      return RequestRecorderPermissionArguments()
    }
  }
}
