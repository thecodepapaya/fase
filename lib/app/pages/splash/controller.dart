part of 'view.dart';

final startUpProvider = StateNotifierProvider((ref) {
  final controller = _VSController();

  controller.startUpProcesses();

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

  final deviceProcessList = UnmodifiableListView([
    FConnectivityService(),
    FDeviceInfoService(),
    FPackageInfoService(),
    FSecureDeviceService(),
    FSecureStorageService(),
    FWifiInfoService(),
  ]);

  Future<void> startUpProcesses() async {
    await Future.wait(
      deviceProcessList.map((amenity) {
        return amenity.startUp().then((data) => amenity.onStartUp(data));
      }),
    );

    state = state.copyWith(isBootUpComplete: true);

    // TODO undo
    // appRouter.pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
    appRouter.pushAndPopUntil(const CourseListRoute(), predicate: (_) => false);
  }
}
