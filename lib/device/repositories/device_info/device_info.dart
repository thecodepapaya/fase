import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../service.dart';
import 'package:device_info_plus/device_info_plus.dart';

class FDeviceInfoService implements FService {
  String? _model;
  String? _brand;
  String? _fingerprint;
  String? _type;
  String? _id;
  String? _device;
  String? _tags;
  String? _sdk;
  String? _os;
  String? _osVersion;

  String? get model => _model;
  String? get brand => _brand;
  String? get fingerprint => _fingerprint;
  String? get type => _type;
  String? get id => _id;
  String? get device => _device;
  String? get tags => _tags;
  String? get sdk => _sdk;
  String? get os => _os;
  String? get osVersion => _osVersion;

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
      _fingerprint = androidInfo.fingerprint ?? '';
      _type = androidInfo.type ?? '';
      _id = androidInfo.androidId ?? '';
      _device = androidInfo.device ?? '';
      _tags = androidInfo.tags ?? '';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      debugPrint('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

      _model = iosInfo.model ?? '';
      _brand = 'Apple';
      _fingerprint = '';
      _type = iosInfo.utsname.release ?? '';
      _id = iosInfo.identifierForVendor ?? '';
      _device = iosInfo.utsname.machine ?? '';
      _tags = '';
    } else if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      debugPrint(
          'Running on ${webBrowserInfo.userAgent}'); // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"

      _model = webBrowserInfo.browserName.name;
      _brand = webBrowserInfo.vendor ?? '';
      _fingerprint = webBrowserInfo.platform ?? '';
      _type = '';
      _id = '';
      _device = webBrowserInfo.appName ?? '';
      _tags = webBrowserInfo.userAgent ?? '';
    }

    _os = Platform.operatingSystem;
    _osVersion = Platform.operatingSystemVersion;
  }
}
