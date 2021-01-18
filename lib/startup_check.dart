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
  bool isRooted() {
    throw UnimplementedError();
  }

  /// Checks if the device is connected to a WiFi network.
  bool isWifiConnected() {
    throw UnimplementedError();
  }

  /// Checks if the device is connected to the IIITV Institute WiFi. This
  /// function checks for the obtained BSSID and WiFi name for the
  /// Institute WiFi
  bool isIIITVWifiConnected() {
    throw UnimplementedError();
  }

  /// Checks if the application version is at-least the minimum specified by
  /// the server. This is necessary to restrict students from using older
  /// versions of the application which may contain exploitable bugs.
  bool isMinVersion() {
    throw UnimplementedError();
  }
}
