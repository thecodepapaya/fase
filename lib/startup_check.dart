class StartupCheck {
  /// Checks if the device is an actual device or an emulator.
  /// Emulators cannot be allowed for registering attendance.
  bool isPhysicalDevice() {
    return false;
  }

  /// Checks if the device is rooted. Rooted devices are less trust-worthy.
  bool isRooted() {
    return false;
  }

  /// Checks if the device is connected to a WiFi network.
  bool isWifiConnected() {
    return false;
  }

  /// Checks if the device is connected to the institute WiFi
  bool isIIITVWifiConnected() {
    return false;
  }

  /// Checks if the application version is at-least the minimum specified by
  /// the server. This is necessary to restrict students from using older
  /// versions of the application which may contain exploitable bugs.
  bool isMinVersion() {
    return false;
  }
}
