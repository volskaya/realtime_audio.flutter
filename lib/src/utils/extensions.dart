import 'package:flutter/services.dart';

extension MethodChannelExtension on MethodChannel {
  Future<T> invokeMethodData<T>(
    String method,
    T Function(Map<String, dynamic> json) converter, [
    dynamic arguments,
  ]) async {
    final resp = await invokeMapMethod<String, dynamic>(method, arguments);
    if (resp == null) {
      throw PlatformException(
        code: 'MISSING_DATA',
        message: 'Method channel response is missing data',
      );
    }
    return converter(resp);
  }
}
