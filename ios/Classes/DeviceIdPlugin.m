#import "DeviceIdPlugin.h"
#import <sys/utsname.h>

@implementation DeviceIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:@"bkncr/device_id"
            binaryMessenger:[registrar messenger]];
  DeviceIdPlugin *instance = [[DeviceIdPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
  if ([@"getDeviceId" isEqualToString:call.method]) {
    UIDevice *device = [UIDevice currentDevice];

   result([[device identifierForVendor] UUIDString]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end