part of 'view.dart';

final startUpProvider = StateNotifierProvider((ref) {
  final controller = _VSController();

  controller._startUpProcesses();

  return controller;
});

class _ViewState {
  final bool isBootUpComplete;

  _ViewState({
    required this.isBootUpComplete,
  });

  _ViewState.initial()
      : this(
          isBootUpComplete: false,
        );

  _ViewState copyWith({
    bool? isBootUpComplete,
  }) {
    return _ViewState(
      isBootUpComplete: isBootUpComplete ?? this.isBootUpComplete,
    );
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController() : super(_ViewState.initial());

  final _processList = UnmodifiableListView([
    FConnectivityService.instance,
    FDeviceInfoService.instance,
    FPackageInfoService.instance,
    FSafeDeviceService.instance,
    FSecureStorageService.instance,
    FWifiInfoService.instance,
    FPermissionService.instance,
  ]);

  Future<void> _startUpProcesses() async {
    await _initializeFirebase();

    await Future.wait(
      _processList.map(_mapServiceToStartUpMethod).toList(),
    );

    state = state.copyWith(isBootUpComplete: true);

    appRouter.pushAndPopUntil(const StartUpCheckRoute(), predicate: (_) => false);
  }

  Future<void> _mapServiceToStartUpMethod(FService service) {
    return service.startUp().then((data) => service.onStartUp(data));
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}
