import 'package:device_info/device_info.dart';
import 'package:fase/utils/startup_check.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info/package_info.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class Globals {
  /// Bool to store if current logged in person is student or faculty
  static bool isFaculty = false;

  static DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  static AndroidDeviceInfo _androidInfo;
  static PackageInfo _packageInfo;
  static FlutterSecureStorage _secureStorage;

  static String _wifiBSSID;
  static String _wifiIP;
  static String _wifiName;

  static String _appName;
  static String _packageName;
  static String _version;
  static int _buildNumber;

  static String _model;
  static String _brand;
  static String _fingerprint;
  static String _type;
  static String _androidId;
  static String _device;
  static String _tags;
  static int _sdk;
  static bool _isPhysicalDevice;
  static bool _isRooted;

  static Future<void> initialize() async {
    _androidInfo = await _deviceInfo.androidInfo;
    _packageInfo = await PackageInfo.fromPlatform();
    _secureStorage = FlutterSecureStorage();

    _wifiBSSID = await WifiInfo().getWifiBSSID();
    _wifiIP = await WifiInfo().getWifiIP();
    _wifiName = await WifiInfo().getWifiName();

    _appName = _packageInfo.appName;
    _packageName = _packageInfo.packageName;
    _version = _packageInfo.version;
    _buildNumber = int.parse(_packageInfo.buildNumber);

    _model = _androidInfo.model;
    _brand = _androidInfo.brand;
    _fingerprint = _androidInfo.fingerprint;
    _type = _androidInfo.type;
    _androidId = _androidInfo.androidId;
    _device = _androidInfo.device;
    _tags = _androidInfo.tags;
    _sdk = _androidInfo.version.sdkInt;
    _isPhysicalDevice = _androidInfo.isPhysicalDevice;
    _isRooted = await StartupCheck().isRooted();
  }

  static FlutterSecureStorage get secureStorage => _secureStorage;

  /// The unique access point of the WLAN
  static String get wifiBSSID => _wifiBSSID;

  /// Local IP of the device connecetd to WLAN

  static String get wifiLocalIP => _wifiIP;

  /// Also known as SSID, the display name of the WLAN network
  static String get wifiName => _wifiName;

  /// The display name of the application. FASE.
  static String get appName => _appName;

  /// The unique package name of the application. in.ac.iiitvadodara.fase
  static String get packageName => _packageName;

  /// The version string of the application. eg v1.0.5
  static String get version => _version;

  /// The build number of the application tied to the [_version]. Must be a natural number
  static int get buildNumber => _buildNumber;

  /// The model of the android device. eg Zenfone
  static String get model => _model;

  /// Manufacturer brand of the application. eg ASUS, Google
  static String get brand => _brand;

  /// Combination of many fields like brand, model, tags, etc
  static String get fingerprint => _fingerprint;
  static String get type => _type;

  /// Unique device ID of the application
  static String get androidId => _androidId;
  static String get device => _device;

  /// Wheather user release tags of build tags
  static String get tags => _tags;

  /// The Android SDK version the application is running on
  static int get sdk => _sdk;

  /// Wheather of not the application is running on a real device or emulator
  static bool get isPhysicalDevice => _isPhysicalDevice;

  /// Checks if the device is rooted or not
  static bool get isRooted => _isRooted;
}
