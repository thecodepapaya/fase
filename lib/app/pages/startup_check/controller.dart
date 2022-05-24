part of 'view.dart';

final _vsProvider = StateNotifierProvider<_VSController, _ViewState>((ref) {
  final controller = _VSController();

  controller.performCheck();

  return controller;
});

class _ViewState {
  final ApiStatus apiStatus;
  final bool? isPhysicalDevice;
  final bool? isDeviceUnRooted;
  final bool? isLocationGranted;
  final bool? isLocationEnabled;
  final bool? isWifiConnected;
  final bool? isIIITVConnected;
  final bool? canPingServer;
  final bool? isMinVersion;
  final bool? isRegistrationValid;

  bool get allChecksPassed =>
      isPhysicalDevice == true &&
      isDeviceUnRooted == true &&
      isLocationGranted == true &&
      isLocationEnabled == true &&
      isWifiConnected == true &&
      isIIITVConnected == true &&
      canPingServer == true &&
      isMinVersion == true &&
      isRegistrationValid == true;

  bool get someChecksFailed =>
      isPhysicalDevice == false ||
      isDeviceUnRooted == false ||
      isLocationGranted == false ||
      isLocationEnabled == false ||
      isWifiConnected == false ||
      isIIITVConnected == false ||
      canPingServer == false ||
      isMinVersion == false ||
      isRegistrationValid == false;

  bool get isCheckingStatus =>
      isPhysicalDevice == null ||
      isDeviceUnRooted == null ||
      isLocationGranted == null ||
      isLocationEnabled == null ||
      isWifiConnected == null ||
      isIIITVConnected == null ||
      canPingServer == null ||
      isMinVersion == null ||
      isRegistrationValid == null;

  _ViewState({
    required this.apiStatus,
    required this.isPhysicalDevice,
    required this.isDeviceUnRooted,
    required this.isLocationGranted,
    required this.isLocationEnabled,
    required this.isWifiConnected,
    required this.isIIITVConnected,
    required this.canPingServer,
    required this.isMinVersion,
    required this.isRegistrationValid,
  });

  _ViewState.initial()
      : this(
          apiStatus: ApiStatus.init,
          isPhysicalDevice: null,
          isDeviceUnRooted: null,
          isLocationGranted: null,
          isLocationEnabled: null,
          isWifiConnected: null,
          isIIITVConnected: null,
          canPingServer: null,
          isMinVersion: null,
          isRegistrationValid: null,
        );

  _ViewState copyWith({
    ApiStatus? apiStatus,
    bool? isPhysicalDevice,
    bool? isDeviceUnRooted,
    bool? isLocationGranted,
    bool? isLocationEnabled,
    bool? isWifiConnected,
    bool? isIIITVConnected,
    bool? canPingServer,
    bool? isMinVersion,
    bool? isRegistrationValid,
  }) {
    return _ViewState(
      apiStatus: apiStatus ?? this.apiStatus,
      isPhysicalDevice: isPhysicalDevice ?? this.isPhysicalDevice,
      isDeviceUnRooted: isDeviceUnRooted ?? this.isDeviceUnRooted,
      isLocationGranted: isLocationGranted ?? this.isLocationGranted,
      isLocationEnabled: isLocationEnabled ?? this.isLocationEnabled,
      isWifiConnected: isWifiConnected ?? this.isWifiConnected,
      isIIITVConnected: isIIITVConnected ?? this.isIIITVConnected,
      canPingServer: canPingServer ?? this.canPingServer,
      isMinVersion: isMinVersion ?? this.isMinVersion,
      isRegistrationValid: isRegistrationValid ?? this.isRegistrationValid,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController() : super(_ViewState.initial());

  Future<bool> performCheck() async {
    state = state.copyWith(apiStatus: ApiStatus.loading);

    state = state.copyWith(apiStatus: ApiStatus.success);

    return Future.value(true);
  }

  void onSignOutButtonPressed() {}

  void onActionButtonPressed() {
    if (state.allChecksPassed) {
      _proceedToCourseSelection();
    } else if (!(state.isRegistrationValid ?? false)) {
      _performDeviceRegistration();
    } else {
      // Some checks failing, do nothing
    }
  }

  void _proceedToCourseSelection() {}

  void _performDeviceRegistration() {}

  void onSidebarCourseTapped(String courseId) {}

  void _resetAllCheck() {
    state = state.copyWith(
      isPhysicalDevice: null,
      isDeviceUnRooted: null,
      isLocationGranted: null,
      isLocationEnabled: null,
      isWifiConnected: null,
      isIIITVConnected: null,
      canPingServer: null,
      isMinVersion: null,
      isRegistrationValid: null,
    );
  }
}
