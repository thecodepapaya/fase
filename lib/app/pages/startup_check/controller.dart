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
    _resetAllCheck();
    _wifiStreamSetup();

    await _checkAllConditions();

    return Future.value(state.allChecksPassed);
  }

  void _wifiStreamSetup() {
    final wifiStatusStream = FConnectivityService.instance.wifiConnectivity;

    wifiStatusStream.listen((ConnectivityStatus status) {
      final isWifiConnected = status == ConnectivityStatus.wifiConnected;
      state = state.copyWith(isWifiConnected: isWifiConnected);
    });
  }

  Future<void> _checkAllConditions() async {
    state = state.copyWith(isPhysicalDevice: await _isPhysicalDevice());
    state = state.copyWith(isDeviceUnRooted: await _isDeviceUnRooted());
    state = state.copyWith(isLocationGranted: await _isLocationGranted());
    state = state.copyWith(isLocationEnabled: await _isLocationEnabled());
    state = state.copyWith(isWifiConnected: await _isWifiConnected());
    state = state.copyWith(isIIITVConnected: await _isIIITVConnected());
    state = state.copyWith(canPingServer: await _canPingServer());
    state = state.copyWith(isMinVersion: await _isMinVersion());
    state = state.copyWith(isRegistrationValid: await _isRegistrationValid());
  }

  Future<void> onSignOutButtonPressed() async {
    log('onSignOutButtonPressed');

    await AuthUsecase.instance.logOutUser();
    appRouter.pushAndPopUntil(const StartUpCheckRoute(), predicate: (_) => false);
    _resetAllCheck();
  }

  Future<void> onActionButtonPressed() async {
    if (state.allChecksPassed) {
      _proceedToCourseSelection();
    } else if (!(state.isRegistrationValid ?? false)) {
      await _performDeviceRegistration();
      await _checkAllConditions();
    } else {
      // Some checks failing, do nothing
    }
  }

  void _proceedToCourseSelection() {
    appRouter.navigate(const CourseListRoute());
  }

  Future<void> _performDeviceRegistration() async {}

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

  Future<bool> _isPhysicalDevice() async {
    final bool isPhysicalDevice = await StartUpCheckUsecase.instance.checkIfPhysicalDevice();

    return isPhysicalDevice;
  }

  Future<bool> _isDeviceUnRooted() async {
    final bool isDeviceUnRooted = await StartUpCheckUsecase.instance.checkIfUnRooted();

    return isDeviceUnRooted;
  }

  Future<bool> _isLocationGranted() async {
    final bool isLocationPermissionGranted = await StartUpCheckUsecase.instance.checkIfLocationGranted();

    return isLocationPermissionGranted;
  }

  Future<bool> _isLocationEnabled() async {
    final bool isLocationPermissionGranted = await StartUpCheckUsecase.instance.checkIfLocationGranted();
    final bool isLocationEnabled;

    if (isLocationPermissionGranted) {
      isLocationEnabled = await StartUpCheckUsecase.instance.checkIfLocationEnabled();
    } else {
      isLocationEnabled = false;
    }

    return isLocationEnabled;
  }

  Future<bool> _isWifiConnected() async {
    final bool isWifiConnected = await StartUpCheckUsecase.instance.checkIfWifiConnected();

    return isWifiConnected;
  }

  Future<bool> _isIIITVConnected() async {
    late final bool isIIITVConnected;

    final isWifiConnected = await _isWifiConnected();

    if (!isWifiConnected) {
      return false;
    }

    isIIITVConnected = await StartUpCheckUsecase.instance.checkIfIIITVWifiConnected();

    return isIIITVConnected;
  }

  Future<bool> _canPingServer() async {
    final bool canPingServer = await StartUpCheckUsecase.instance.checkCanPingServer();

    return canPingServer;
  }

  Future<bool> _isMinVersion() async {
    final bool isMinVersion = await StartUpCheckUsecase.instance.checkAppUpToDate();

    return isMinVersion;
  }

  Future<bool> _isRegistrationValid() async {
    final bool isRegistrationValid = await StartUpCheckUsecase.instance.checkRegistrationValid();

    return isRegistrationValid;
  }
}
