import 'dart:io';

import 'package:safe_device/safe_device.dart';

import '../../../domain/services/safe_device/safe_device_service.dart';

class FSafeDeviceServiceImpl implements FSafeDeviceService {
  late bool _isRooted;
  late bool _isRealDevice;
  late bool _canMockLocation;
  late bool _isDevelopmentDevice;

  @override
  bool get isRooted => _isRooted;
  @override
  bool get isRealDevice => _isRealDevice;
  @override
  bool get canMockLocation => _canMockLocation;
  @override
  bool get isDevelopmentDevice => _isDevelopmentDevice;

  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    // Do nothing
  }

  @override
  Future<void> startUp() async {
    _isRooted = await SafeDevice.isJailBroken;
    _isRealDevice = await SafeDevice.isRealDevice;

    // Extras
    _isDevelopmentDevice = Platform.isAndroid ? await SafeDevice.isDevelopmentModeEnable : false;

    // Mock location test is only supported on Android
    _canMockLocation = Platform.isAndroid ? await SafeDevice.canMockLocation : true;
  }
}
