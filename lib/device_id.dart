
import 'device_id_platform_interface.dart';

class DeviceId {
  Future<String?> getDeviceId() {
    return DeviceIdPlatform.instance.getDeviceId();
  }
}
