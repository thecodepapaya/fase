import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class Globals {
  static DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  static AndroidDeviceInfo _androidInfo;
  static PackageInfo _packageInfo;

  static String _wifiBSSID;
  static String _wifiIP;
  static String _wifiName;

  static String _appName;
  static String _packageName;
  static String _version;
  static String _buildNumber;

  static String _model;
  static String _brand;
  static String _fingerprint;
  static String _id;
  static String _type;
  static String _androidId;
  static String _device;
  static String _tags;
  static bool _isPhysicalDevice;

  static Future<void> initialize() async {
    _androidInfo = await _deviceInfo.androidInfo;
    _packageInfo = await PackageInfo.fromPlatform();

    _wifiBSSID = await WifiInfo().getWifiBSSID();
    _wifiIP = await WifiInfo().getWifiIP();
    _wifiName = await WifiInfo().getWifiName();

    _appName = _packageInfo.appName;
    _packageName = _packageInfo.packageName;
    _version = _packageInfo.version;
    _buildNumber = _packageInfo.buildNumber;

    _model = _androidInfo.model;
    _isPhysicalDevice = _androidInfo.isPhysicalDevice;
    _brand = _androidInfo.brand;
    _fingerprint = _androidInfo.fingerprint;
    _id = _androidInfo.id;
    _type = _androidInfo.type;
    _androidId = _androidInfo.androidId;
    _device = _androidInfo.device;
    _tags = _androidInfo.tags;
  }

  String get wifiBSSID => _wifiBSSID;
  String get wifiIP => _wifiIP;
  String get wifiName => _wifiName;

  String get appName => _appName;
  String get packageName => _packageName;
  String get version => _version;
  String get buildNumber => _buildNumber;

  String get model => _model;
  String get brand => _brand;
  String get fingerprint => _fingerprint;
  String get id => _id;
  String get type => _type;
  String get androidId => _androidId;
  String get device => _device;
  String get tags => _tags;
  bool get isPhysicalDevice => _isPhysicalDevice;
}
