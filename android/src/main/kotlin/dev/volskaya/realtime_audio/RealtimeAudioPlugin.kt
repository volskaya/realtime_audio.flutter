package dev.volskaya.realtime_audio

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.PluginRegistry
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.MainScope
import kotlinx.coroutines.launch
import java.util.UUID
import kotlin.coroutines.Continuation
import kotlin.coroutines.resume
import kotlin.coroutines.suspendCoroutine


class RealtimeAudioPlugin : FlutterPlugin, MethodCallHandler, PluginRegistry.RequestPermissionsResultListener,
  ActivityAware {
  private val scope: CoroutineScope get() = MainScope()

  private var context: Context? = null
  private var activity: Activity? = null
  private var methodChannel: MethodChannel? = null
  private var binaryMessenger: BinaryMessenger? = null
  private var realtimeAudios: MutableMap<String, RealtimeAudio> = mutableMapOf()

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    context = binding.applicationContext
    binaryMessenger = binding.binaryMessenger
    methodChannel = MethodChannel(
      binding.binaryMessenger,
      "dev.volskaya.RealtimeAudio/plugin"
    ).also { it.setMethodCallHandler(this) }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel?.setMethodCallHandler(null)
    disposeAllInstances()
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    runCatching { handleMethodCallSafe(call, result) }
      .onFailure { result.error("INTERNAL", it.localizedMessage ?: "Undefined message.", it.stackTraceToString()) }
  }

  private fun handleMethodCallSafe(call: MethodCall, result: MethodChannel.Result) {
    val binaryMessenger = this.binaryMessenger ?: return
    var value: Any? = null

    when (call.method) {
      "create" -> {
        val context = this.context ?: return
        val arguments = CreateArguments.fromMethodCall(call)

        if (!realtimeAudios.isEmpty()) {
          if (arguments.isFirstCreate) {
            disposeAllInstances()
          } else {
            throw Error("Only 1 active RealtimeAudio instance allowed at a time.")
          }
        }

        val id = UUID.randomUUID().toString()
        val methodChannel = MethodChannel(
          binaryMessenger,
          "dev.volskaya.RealtimeAudio/engines/${id}"
        )

        val engine = RealtimeAudio(
          id = id,
          arguments = arguments,
          context = context,
          methodChannel = methodChannel
        )

        realtimeAudios[id] = engine
        value = CreateResponse(id).toMap()
      }

      "destroy" -> {
        val arguments = DestroyArguments.fromMethodCall(call)
        realtimeAudios.remove(arguments.id)?.let {
          it.dispose()
          value = DestroyResponse().toMap()
        } ?: run {
          throw Error("Engine not found for id ${arguments.id}.")
        }
      }

      "getRecordPermission" -> {
        GetRecorderPermissionArguments.fromMethodCall(call)
        val permission = getRecordPermission()

        value = GetRecorderPermissionResponse(
          permission = permission
        ).toMap()
      }

      "requestRecordPermission" -> {
        RequestRecorderPermissionArguments.fromMethodCall(call)
        value = scope.launch {
          val permission = requestRecordPermission()
          val response = RequestRecorderPermissionResponse(
            permission = permission
          ).toMap()

          result.success(response)
        }
      }
    }

    // HACK(volskaya): Can't type check the coroutine, because it is private in file.
    val isValueCoroutine = value?.let { "${it::class.java}" == "class kotlinx.coroutines.StandaloneCoroutine" } ?: false

    if (!isValueCoroutine) {
      value?.let { result.success(it) } ?: run { result.notImplemented() }
    }
  }

  private fun disposeAllInstances() {
    runCatching {
      val instances = realtimeAudios.values.toList()
      realtimeAudios.clear()
      instances.forEach { it.dispose() }
    }
  }

  private val pendingRecordPermissionRequests: MutableMap<Int, Continuation<Int?>> = mutableMapOf()

  private fun getRecordPermission(): RealtimeAudioRecorderPermission {
    val context = this.context ?: return RealtimeAudioRecorderPermission.undetermined
    val permission = ContextCompat.checkSelfPermission(context, Manifest.permission.RECORD_AUDIO)
    return when (permission) {
      PackageManager.PERMISSION_GRANTED -> RealtimeAudioRecorderPermission.granted
      PackageManager.PERMISSION_DENIED -> RealtimeAudioRecorderPermission.denied
      else -> RealtimeAudioRecorderPermission.undetermined
    }
  }

  private suspend fun requestRecordPermission(): RealtimeAudioRecorderPermission {
    val activity = this.activity ?: return RealtimeAudioRecorderPermission.undetermined
    val requestId = UUID.randomUUID().toString().hashCode()
    val permissions = arrayOf(Manifest.permission.RECORD_AUDIO)
    val permission = suspendCoroutine { continuation ->
      pendingRecordPermissionRequests[requestId] = continuation
      runCatching {
        ActivityCompat.requestPermissions(activity, permissions, requestId)
      }.onFailure {
        pendingRecordPermissionRequests.remove(requestId)
        continuation.resume(null)
      }
    }

    return when (permission) {
      PackageManager.PERMISSION_GRANTED -> RealtimeAudioRecorderPermission.granted
      PackageManager.PERMISSION_DENIED -> RealtimeAudioRecorderPermission.denied
      else -> getRecordPermission()
    }
  }

  override fun onRequestPermissionsResult(
    requestCode: Int,
    permissions: Array<out String>,
    grantResults: IntArray
  ): Boolean {
    pendingRecordPermissionRequests.remove(requestCode)?.resume(grantResults.first())
    return true
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    activity = null
  }
}
