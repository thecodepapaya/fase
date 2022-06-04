import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/services/device_info/device_info_service.dart';

class FDeviceInfoServiceImpl implements FDeviceInfoService {
  String? _model;
  String? _brand;
  String? _id;
  String? _deviceName;
  String? _os;
  String? _osVersion;

  @override
  String get model => _model ?? '';
  @override
  String get brand => _brand ?? '';

  /// A unique device ID. This ID can change on device factory reset and OS updates
  @override
  String get id => _id ?? '';
  @override
  String get deviceName => _deviceName ?? '';
  @override
  String get os => _os ?? '';
  @override
  String get osVersion => _osVersion ?? '';

  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future onStartUp(dynamic data) async {
    // Do nothing
    return;
  }

  @override
  Future<void> startUp() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      debugPrint('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

      _model = androidInfo.model ?? '';
      _brand = androidInfo.brand ?? '';
      _id = androidInfo.androidId ?? '';
      _deviceName = androidInfo.device ?? '';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      debugPrint('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

      _model = iosInfo.model ?? '';
      _brand = 'Apple';
      _id = iosInfo.identifierForVendor ?? '';
      _deviceName = iosInfo.utsname.machine ?? '';
    } else if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      debugPrint(
          'Running on ${webBrowserInfo.userAgent}'); // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"

      _model = webBrowserInfo.browserName.name;
      _brand = webBrowserInfo.vendor ?? '';
      _id = '';
      _deviceName = webBrowserInfo.appName ?? '';
    }

    _os = Platform.operatingSystem;
    _osVersion = Platform.operatingSystemVersion;
  }
}
