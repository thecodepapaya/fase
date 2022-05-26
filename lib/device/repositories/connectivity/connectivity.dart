import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../domain/services/connectivity/connectivity_service.dart';

enum ConnectivityStatus {
  wifiConnected,
  wifiDisconnected,
}

class FConnectivityServiceImpl implements FConnectivityService {
  late final _wifiConnectivityController = StreamController<ConnectivityStatus>.broadcast();
  late StreamSubscription<ConnectivityResult> _connectivity;

  @override
  Stream<ConnectivityStatus> get wifiConnectivity => _wifiConnectivityController.stream;

  @override
  void onShutDown() {
    _connectivity.cancel();
    _wifiConnectivityController.close();
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    // Do nothing
  }

  @override
  Future<void> startUp() async {
    _connectivity = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult connectivityResult) {
        if (connectivityResult == ConnectivityResult.wifi) {
          _wifiConnectivityController.add(ConnectivityStatus.wifiConnected);
        } else {
          _wifiConnectivityController.add(ConnectivityStatus.wifiDisconnected);
        }
      },
    );
  }

  @override
  Future<ConnectivityStatus> checkWifiConnectivity() async {
    late final bool isWifiConnected;

    final connectivityResult = await Connectivity().checkConnectivity();
    isWifiConnected = connectivityResult == ConnectivityResult.wifi;

    return isWifiConnected ? ConnectivityStatus.wifiConnected : ConnectivityStatus.wifiDisconnected;
  }
}
