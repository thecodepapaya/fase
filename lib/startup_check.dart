import 'package:connectivity/connectivity.dart';
import 'package:fase/globals.dart';
import 'package:fase/string_resource.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

/// This class contains a set of functions to perform security and stability
/// checks at application startup and before registering attendance.
class StartupCheck {
  /// Checks if all the conditions necessary for registering attendance are
  /// satisfied.
  Future<bool> allChecksPass() async {
    // TODO: Remove comments
    // return this.isPhysicalDevice() &&
    //     await this.isWifiConnected() &&
    //     await this.isIIITVConnected() &&
    //     await this.isLocationEnabled() &&
    //     await this.isLocationGranted() &&
    //     this.isMinVersion();
    return Future.value(true);
  }

  /// Checks if the device is an actual device or an emulator.
  /// Emulators cannot be allowed for registering attendance.
  bool isPhysicalDevice() {
    return Globals().isPhysicalDevice;
  }

  /// Checks if the device is rooted. Rooted devices are less trust-worthy and
  /// so it's worth collecting the info before registering attendance.
  Future<bool> isRooted() async {
    const platform = const MethodChannel(StringsResource.methodChannel);
    bool isRooted = false;
    try {
      final bool result = await platform.invokeMethod('getRootStatus');
      isRooted = result;
    } on PlatformException catch (e) {
      print('''Failed to get root status, reverting to default false.
      Error stack $e''');
    }
    print("Result is Rooted: $isRooted");
    return isRooted;
  }

  /// Checks if the device is connected to a WiFi network.
  Future<bool> isWifiConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
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
      Globals().wifiBSSID;
      Globals().wifiName;
      Globals().wifiIP;
      throw UnimplementedError();
    } else {
      return false;
    }
  }

  /// Checks if the application version is at-least the minimum specified by
  /// the server. This is necessary to restrict students from using older
  /// versions of the application which may contain exploitable bugs.
  bool isMinVersion() {
    // TODO: Add logic to verify app version ID
    throw UnimplementedError();
  }

  /// Checks if the location permission has been granted or not. Location
  /// permission is necessary for getting WiFi details like SSID and BSSID
  /// which are used to verify that the device is connected to IIITV WLAN.
  Future<bool> isLocationGranted() async {
    if (await Permission.location.status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  /// Checks if location services are enabled or not. Location permissions
  /// must have been granted to check for service status.
  Future<bool> isLocationEnabled() async {
    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      return true;
    } else {
      return false;
    }
  }
}
