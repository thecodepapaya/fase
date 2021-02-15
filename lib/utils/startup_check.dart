import 'package:connectivity/connectivity.dart';
import 'package:fase/globals.dart';
import 'package:fase/models/metadata.dart';
import 'package:fase/string_resource.dart';
import 'package:fase/utils/api.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

/// This class contains a set of functions to perform security and stability
/// checks at application startup and before registering attendance.
class StartupCheck {
  bool _lastCheckIsPhysicalDevice = false;
  bool _lastCheckIsRooted = false;
  bool _lastCheckIsLocationGranted = false;
  bool _lastCheckIsLocationEnabled = false;
  bool _lastCheckIsWifiConnected = false;
  bool _lastCheckIsIIITVConnected = false;
  bool _lastCheckCanPing = false;
  bool _lastCheckIsMinVersion = false;
  bool _lastCheckIsRegValid = false;

  bool get lastCheckIsPhysicalDevice => _lastCheckIsPhysicalDevice;
  bool get lastCheckIsRooted => _lastCheckIsRooted;
  bool get lastCheckIsLocationGranted => _lastCheckIsLocationGranted;
  bool get lastCheckIsLocationEnabled => _lastCheckIsLocationEnabled;
  bool get lastCheckIsWifiConnected => _lastCheckIsWifiConnected;
  bool get lastCheckIsIIITVConnected => _lastCheckIsIIITVConnected;
  bool get lastCheckCanPing => _lastCheckCanPing;
  bool get lastCheckIsMinVersion => _lastCheckIsMinVersion;
  bool get lastCheckIsRegistrationValid => _lastCheckIsRegValid;

  /// Checks if all the conditions necessary for registering attendance are
  /// satisfied. isRooted and isRegistrationValid are not part of this check.
  Future<bool> check() async {
    _lastCheckIsPhysicalDevice = this.isPhysicalDevice();
    _lastCheckIsRooted = await this.isRooted();
    _lastCheckIsLocationEnabled = await this.isLocationEnabled();
    _lastCheckIsLocationGranted = await this.isLocationGranted();
    _lastCheckIsWifiConnected = await this.isWifiConnected();
    _lastCheckIsIIITVConnected = await this.isIIITVConnected();
    _lastCheckCanPing = await this.canPing(_lastCheckIsIIITVConnected);
    _lastCheckIsMinVersion = await this.isMinVersion(_lastCheckCanPing);
    _lastCheckIsRegValid = await this.isRegistrationValid(_lastCheckCanPing);

    print("lastCheckIsPhysicalDevice: $_lastCheckIsPhysicalDevice");
    print("lastCheckIsRooted: $_lastCheckIsRooted");
    print("lastCheckIsLocationEnabled: $_lastCheckIsLocationEnabled");
    print("lastCheckIsLocationGranted: $_lastCheckIsLocationGranted");
    print("lastCheckIsWifiConnected: $_lastCheckIsWifiConnected");
    print("lastCheckIsIIITVConnected: $_lastCheckIsIIITVConnected");
    print("lastCheckCanPing: $_lastCheckCanPing");
    print("lastCheckIsMinVersion: $_lastCheckIsMinVersion");
    print("lastCheckIsRegValid: $_lastCheckIsRegValid");

    return _lastCheckIsPhysicalDevice &&
        _lastCheckIsLocationEnabled &&
        _lastCheckIsLocationGranted &&
        _lastCheckIsWifiConnected &&
        _lastCheckIsIIITVConnected &&
        _lastCheckCanPing &&
        _lastCheckIsMinVersion;
  }

  /// Checks if the device is an actual device or an emulator.
  /// Emulators cannot be allowed for registering attendance.
  bool isPhysicalDevice() {
    return Globals.isPhysicalDevice;
  }

  /// Checks if the device is rooted. Rooted devices are less trust-worthy and
  /// so it's worth collecting the info before registering attendance.
  Future<bool> isRooted() async {
    const platform = const MethodChannel(StringResources.methodChannel);
    bool isRooted = false;
    try {
      isRooted = await platform.invokeMethod('getRootStatus');
    } on PlatformException catch (e) {
      print('''Failed to get root status, reverting to default false.
      Error stack $e''');
    }
    // print("Result is Rooted: $isRooted");
    return isRooted;
  }

  /// Checks if the location permission has been granted or not. Location
  /// permission is necessary for getting WiFi details like SSID and BSSID
  /// which are used to verify that the device is connected to IIITV WLAN.
  Future<bool> isLocationGranted() async {
    return await Permission.location.status.isGranted;
  }

  /// Checks if location services are enabled or not. Location permissions
  /// must have been granted to check for service status.
  Future<bool> isLocationEnabled() async {
    return await Permission.locationWhenInUse.serviceStatus.isEnabled;
  }

  /// Checks if the device is connected to a WiFi network.
  Future<bool> isWifiConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi;
  }

  /// Checks if the device is connected to the IIITV Institute WiFi. This
  /// function checks for the obtained BSSID and WiFi name for the
  /// Institute WiFi
  Future<bool> isIIITVConnected() async {
    if (await this.isWifiConnected() &&
        await this.isLocationGranted() &&
        await this.isLocationEnabled()) {
      // check for harcoded BSSID and SSID here
      // TODO: add wifi verification here
      Globals.wifiBSSID;
      Globals.wifiName;
      Globals.wifiLocalIP;
      return true;
    } else {
      return false;
    }
  }

  /// Checks if the client can ping the server or not. The ability to
  /// ping the server is necessary for app functionality as everything else
  /// depends on it.
  Future<bool> canPing(bool isIIITVConnected) async {
    if (isIIITVConnected) {
      return await MetadataApi.getPing();
    } else {
      return Future.value(false);
    }
  }

  /// Checks if the application version is at-least the minimum specified by
  /// the server. This is necessary to restrict students from using older
  /// versions of the application which may contain exploitable bugs.
  Future<bool> isMinVersion(bool canPing) async {
    if (canPing) {
      Metadata metadata = await MetadataApi.getMetadata();
      if (Globals.buildNumber >= metadata.minAppBuild)
        return true;
      else
        return false;
    } else {
      return Future.value(false);
    }
  }

  /// Checks if the current registration is valid or not. The secure server_key
  /// is used to determine validity by hitting the registration endpoint.
  /// Checking validity is essential since outdated registrations must not be
  /// allowed to mark attendance
  Future<bool> isRegistrationValid(bool canPing) async {
    if (canPing) {
      return await RegistrationAPi.isRegistrationValid();
    } else {
      return Future.value(false);
    }
  }
}
