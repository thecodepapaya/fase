part of 'view.dart';

final _vsProvider = StateNotifierProvider.autoDispose<_VSController, _ViewState>((ref) {
  final controller = _VSController();

  controller._performCheck();

  return controller;
});

class _ViewState {
  final ApiStatus apiStatus;
  final CheckState isPhysicalDevice;
  final CheckState isDeviceUnRooted;
  final CheckState isLocationGranted;
  final CheckState isLocationEnabled;
  final CheckState isWifiConnected;
  final CheckState isIIITVConnected;
  final CheckState canPingServer;
  final CheckState isMinVersion;
  final CheckState isUserLoggedIn;
  final CheckState isRegistrationValid;

  bool get allChecksPassed =>
      isPhysicalDevice == CheckState.valid &&
      isDeviceUnRooted == CheckState.valid &&
      isLocationGranted == CheckState.valid &&
      isLocationEnabled == CheckState.valid &&
      isWifiConnected == CheckState.valid &&
      isIIITVConnected == CheckState.valid &&
      canPingServer == CheckState.valid &&
      isMinVersion == CheckState.valid &&
      isUserLoggedIn == CheckState.valid &&
      isRegistrationValid == CheckState.valid;

  bool get someChecksFailed =>
      isPhysicalDevice == CheckState.invalid ||
      isDeviceUnRooted == CheckState.invalid ||
      isLocationGranted == CheckState.invalid ||
      isLocationEnabled == CheckState.invalid ||
      isWifiConnected == CheckState.invalid ||
      isIIITVConnected == CheckState.invalid ||
      canPingServer == CheckState.invalid ||
      isMinVersion == CheckState.invalid ||
      isUserLoggedIn == CheckState.invalid ||
      isRegistrationValid == CheckState.invalid;

  bool get everythingExceptRegistrationPassed =>
      isPhysicalDevice == CheckState.valid &&
      isDeviceUnRooted == CheckState.valid &&
      isLocationGranted == CheckState.valid &&
      isLocationEnabled == CheckState.valid &&
      isWifiConnected == CheckState.valid &&
      isIIITVConnected == CheckState.valid &&
      canPingServer == CheckState.valid &&
      isMinVersion == CheckState.valid &&
      isUserLoggedIn == CheckState.valid &&
      isRegistrationValid == CheckState.invalid;

  bool get isCheckingStatus =>
      isPhysicalDevice == CheckState.checking ||
      isDeviceUnRooted == CheckState.checking ||
      isLocationGranted == CheckState.checking ||
      isLocationEnabled == CheckState.checking ||
      isWifiConnected == CheckState.checking ||
      isIIITVConnected == CheckState.checking ||
      canPingServer == CheckState.checking ||
      isMinVersion == CheckState.checking ||
      isUserLoggedIn == CheckState.checking ||
      isRegistrationValid == CheckState.checking;

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
    required this.isUserLoggedIn,
    required this.isRegistrationValid,
  });

  _ViewState.initial()
      : this(
          apiStatus: ApiStatus.init,
          isPhysicalDevice: CheckState.checking,
          isDeviceUnRooted: CheckState.checking,
          isLocationGranted: CheckState.checking,
          isLocationEnabled: CheckState.checking,
          isWifiConnected: CheckState.checking,
          isIIITVConnected: CheckState.checking,
          canPingServer: CheckState.checking,
          isMinVersion: CheckState.checking,
          isUserLoggedIn: CheckState.checking,
          isRegistrationValid: CheckState.checking,
        );

  _ViewState copyWith({
    ApiStatus? apiStatus,
    CheckState? isPhysicalDevice,
    CheckState? isDeviceUnRooted,
    CheckState? isLocationGranted,
    CheckState? isLocationEnabled,
    CheckState? isWifiConnected,
    CheckState? isIIITVConnected,
    CheckState? canPingServer,
    CheckState? isMinVersion,
    CheckState? isUserLoggedIn,
    CheckState? isRegistrationValid,
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
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
      isRegistrationValid: isRegistrationValid ?? this.isRegistrationValid,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController() : super(_ViewState.initial());

  Future<bool> _performCheck() async {
    log('_performCheck');

    _resetAllCheck();
    _wifiStreamSetup();

    await _checkAllConditions();

    return Future.value(state.allChecksPassed);
  }

  void _wifiStreamSetup() {
    log('_wifiStreamSetup');

    final wifiStatusStream = FConnectivityService.instance.wifiConnectivity;

    wifiStatusStream.listen((ConnectivityStatus status) async {
      final isWifiConnected = status == ConnectivityStatus.wifiConnected;

      final wifiConnectedState = isWifiConnected ? CheckState.valid : CheckState.invalid;
      state = state.copyWith(isWifiConnected: wifiConnectedState);

      final iiitvConnectedState = await _isIIITVConnected();
      state = state.copyWith(isIIITVConnected: iiitvConnectedState);

      final pingServerState = await _canPingServer();
      state = state.copyWith(canPingServer: pingServerState);

      final minVersionState = await _isMinVersion();
      state = state.copyWith(isMinVersion: minVersionState);

      final registrationValidState = await _isRegistrationValid();
      state = state.copyWith(isRegistrationValid: registrationValidState);
    });
  }

  Future<void> _checkAllConditions() async {
    log('_checkAllConditions');

    state = state.copyWith(isPhysicalDevice: await _isPhysicalDevice());
    state = state.copyWith(isDeviceUnRooted: await _isDeviceUnRooted());
    state = state.copyWith(isLocationGranted: await _isLocationGranted());
    state = state.copyWith(isLocationEnabled: await _isLocationEnabled());
    state = state.copyWith(isWifiConnected: await _isWifiConnected());
    state = state.copyWith(isIIITVConnected: await _isIIITVConnected());
    state = state.copyWith(canPingServer: await _canPingServer());
    state = state.copyWith(isMinVersion: await _isMinVersion());
    state = state.copyWith(isUserLoggedIn: await _isUserLoggedIn());
    state = state.copyWith(isRegistrationValid: await _isRegistrationValid());
  }

  Future<void> refresh() async {
    log('refresh');
    await _performCheck();
  }

  Future<void> onSignOutButtonPressed() async {
    log('onSignOutButtonPressed');

    await FirebaseAuthUsecase.instance.logOutUser();
    _resetAllCheck();
  }

  @Deprecated('Not showing about dialog right now')
  Future<void> onAboutPressed() async {
    log('onAboutPressed');

    final currentContext = appRouter.navigatorKey.currentContext;

    if (currentContext != null) {
      showAboutDialog(
        context: currentContext,
        applicationVersion: FPackageInfoService.instance.version,
        applicationIcon: const Logo(size: 30),
        applicationName: FPackageInfoService.instance.appName,
        applicationLegalese:
            'Attendance system for IIITV. Made by Ashutosh Singh and Tanmay Ambadkar.',
      );
    }
  }

  Future<void> onActionButtonPressed() async {
    final allCheckPassed = state.allChecksPassed;
    final isRegistrationPending = state.everythingExceptRegistrationPassed;

    if (allCheckPassed) {
      _proceedToCourseSelection();
    } else if (isRegistrationPending) {
      await _performDeviceRegistration();
      await _checkAllConditions();
    } else {
      // Some checks failing, do nothing
    }
  }

  void _proceedToCourseSelection() {
    appRouter.navigate(const CourseListRoute());
  }

  Future<void> _performDeviceRegistration() async {
    await RegistrationUsecase.instance.registerUser();
  }

  void onSidebarCourseTapped(String courseId) {}

  void _resetAllCheck() {
    log('_resetAllCheck');

    state = state.copyWith(
      isPhysicalDevice: CheckState.checking,
      isDeviceUnRooted: CheckState.checking,
      isLocationGranted: CheckState.checking,
      isLocationEnabled: CheckState.checking,
      isWifiConnected: CheckState.checking,
      isIIITVConnected: CheckState.checking,
      canPingServer: CheckState.checking,
      isMinVersion: CheckState.checking,
      isUserLoggedIn: CheckState.checking,
      isRegistrationValid: CheckState.checking,
    );
  }

  Future<CheckState> _isPhysicalDevice() async {
    final bool isPhysicalDevice = await SystemCheckUsecase.instance.checkIfPhysicalDevice();
    final isPhysicalDeviceState = isPhysicalDevice ? CheckState.valid : CheckState.invalid;

    return isPhysicalDeviceState;
  }

  Future<CheckState> _isDeviceUnRooted() async {
    final bool isDeviceUnRooted = await SystemCheckUsecase.instance.checkIfUnRooted();
    final isDeviceUnRootedState = isDeviceUnRooted ? CheckState.valid : CheckState.invalid;

    return isDeviceUnRootedState;
  }

  Future<CheckState> _isLocationGranted() async {
    final bool isLocationPermissionGranted = await SystemCheckUsecase.instance.checkIfLocationGranted();
    final isLocationPermissionGrantedState = isLocationPermissionGranted ? CheckState.valid : CheckState.invalid;

    return isLocationPermissionGrantedState;
  }

  Future<CheckState> _isLocationEnabled() async {
    final bool isLocationPermissionGranted = state.isLocationGranted == CheckState.valid;
    final bool isLocationEnabled;
    final CheckState isLocationEnabledState;

    if (isLocationPermissionGranted) {
      isLocationEnabled = await SystemCheckUsecase.instance.checkIfLocationEnabled();
    } else {
      isLocationEnabled = false;
    }

    isLocationEnabledState = isLocationEnabled ? CheckState.valid : CheckState.invalid;

    return isLocationEnabledState;
  }

  Future<CheckState> _isWifiConnected() async {
    final bool isWifiConnected = await SystemCheckUsecase.instance.checkIfWifiConnected();
    final isWifiConnectedState = isWifiConnected ? CheckState.valid : CheckState.invalid;

    return isWifiConnectedState;
  }

  Future<CheckState> _isIIITVConnected() async {
    late final bool isIIITVConnected;

    final isWifiConnected = state.isWifiConnected;

    if (isWifiConnected != CheckState.valid) {
      return isWifiConnected;
    }

    isIIITVConnected = await SystemCheckUsecase.instance.checkIfIIITVWifiConnected();
    final isIIITVConnectedState = isIIITVConnected ? CheckState.valid : CheckState.invalid;

    return isIIITVConnectedState;
  }

  Future<CheckState> _canPingServer() async {
    final isIIITVConnected = state.isIIITVConnected;

    if (isIIITVConnected != CheckState.valid) {
      return isIIITVConnected;
    }

    final bool canPingServer = await SystemCheckUsecase.instance.checkCanPingServer();
    final canPingServerState = canPingServer ? CheckState.valid : CheckState.invalid;

    return canPingServerState;
  }

  Future<CheckState> _isMinVersion() async {
    final canPingServer = state.canPingServer;

    if (canPingServer != CheckState.valid) {
      return canPingServer;
    }

    final bool isMinVersion = await SystemCheckUsecase.instance.checkAppUpToDate();
    final isMinVersionState = isMinVersion ? CheckState.valid : CheckState.invalid;

    return isMinVersionState;
  }

  Future<CheckState> _isUserLoggedIn() async {
    final isIIITVConnected = state.canPingServer;

    if (isIIITVConnected != CheckState.valid) {
      return isIIITVConnected;
    }

    final bool isUserLoggedIn = await SystemCheckUsecase.instance.checkUserLoggedIn();
    final isUserLoggedInState = isUserLoggedIn ? CheckState.valid : CheckState.invalid;

    return isUserLoggedInState;
  }

  Future<CheckState> _isRegistrationValid() async {
    final isIIITVConnected = state.canPingServer;

    if (isIIITVConnected != CheckState.valid) {
      return isIIITVConnected;
    }

    final bool isRegistrationValid = await SystemCheckUsecase.instance.checkRegistrationValid();
    final isRegistrationValidState = isRegistrationValid ? CheckState.valid : CheckState.invalid;

    return isRegistrationValidState;
  }
}
