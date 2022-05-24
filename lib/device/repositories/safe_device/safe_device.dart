import 'dart:io';

import '../../service.dart';
import 'package:safe_device/safe_device.dart';

class FSecureDeviceService implements FService {
  late bool _isRooted;
  late bool _isRealDevice;
  late bool _canMockLocation;
  late bool _isDevelopmentDevice;

  bool get isRooted => _isRooted;
  bool get isRealDevice => _isRealDevice;
  bool get canMockLocation => _canMockLocation;
  bool get isDevelopmentDevice => _isDevelopmentDevice;

  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future<void> onStartUp() async {
    // Do nothing
  }

  @override
  Future<void> startUp() async {
    _isRooted = await SafeDevice.isJailBroken;
    _isRealDevice = await SafeDevice.isRealDevice;

    // Extras
    _isDevelopmentDevice = Platform.isAndroid ? await SafeDevice.isDevelopmentModeEnable : false;
    _canMockLocation = await SafeDevice.canMockLocation;
  }
}
