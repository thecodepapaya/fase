import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../service.dart';

enum ConnectivityStatus {
  connected,
  disconnected,
}

class FConnectivityService implements FService {
  late final _connectivityController = StreamController<ConnectivityStatus>.broadcast();
  late StreamSubscription<ConnectivityResult> _connectivity;

  Stream<ConnectivityStatus> get connectivity => _connectivityController.stream;

  @override
  void onShutDown() {
    _connectivity.cancel();
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    // Do nothing
  }

  @override
  Future<void> startUp() async {
    _connectivity = Connectivity().onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult == ConnectivityResult.none) {
          _connectivityController.add(ConnectivityStatus.disconnected);
        } else {
          _connectivityController.add(ConnectivityStatus.connected);
        }
      },
    );
  }
}
