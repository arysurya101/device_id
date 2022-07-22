import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_id/device_id_method_channel.dart';

void main() {
  MethodChannelDeviceId platform = MethodChannelDeviceId();
  const MethodChannel channel = MethodChannel('bkncr/device_id');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getDeviceId', () async {
    expect(await platform.getDeviceId(), '42');
  });
}
