import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_id_platform_interface.dart';

/// An implementation of [DeviceIdPlatform] that uses method channels.
class MethodChannelDeviceId extends DeviceIdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bkncr/device_id');
  String? _deviceId;

  @override
  Future<String?> getDeviceId() async {
    return _deviceId ??= await methodChannel.invokeMethod<String>('getDeviceId');
  }
}
