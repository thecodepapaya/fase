import 'package:fase/string_resource.dart';
import 'package:flutter/services.dart';

/// This class contains a set of functions to perform security and stability
/// checks at application startup and before registering attendance.
class StartupCheck {
  /// Checks if the device is an actual device or an emulator.
  /// Emulators cannot be allowed for registering attendance.
  bool isPhysicalDevice() {
    throw UnimplementedError();
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
      //failed to get status, reverting to false
      print('''Failed to get root status, reverting to default false.
      Error stack $e''');
    }

    throw UnimplementedError();
  }

  /// Checks if the device is connected to a WiFi network.
  bool isWifiConnected() {
    throw UnimplementedError();
  }

  /// Checks if the device is connected to the IIITV Institute WiFi. This
  /// function checks for the obtained BSSID and WiFi name for the
  /// Institute WiFi
  bool isIIITVConnected() {
    throw UnimplementedError();
  }

  /// Checks if the application version is at-least the minimum specified by
  /// the server. This is necessary to restrict students from using older
  /// versions of the application which may contain exploitable bugs.
  bool isMinVersion() {
    throw UnimplementedError();
  }

  /// Checks if the location permission has been granted or not. Location
  /// permission is necessary for getting WiFi details like SSID and BSSID
  /// which are used to verify that the device is connected to IIITV WLAN.
  bool isLocationGranted() {
    throw UnimplementedError();
  }

  /// Checks if location services are enabled or not. Location permissions
  /// must have been granted to check for service status.
  bool isLocationEnabled() {
    throw UnimplementedError();
  }
}
