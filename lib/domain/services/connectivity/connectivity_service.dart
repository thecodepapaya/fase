import 'package:fase/domain/services/services.dart';

import '../../../device/repositories/connectivity/connectivity.dart';

abstract class FConnectivityService implements FService {
  FConnectivityService._();

  static final instance = FConnectivityServiceImpl();

  Stream<ConnectivityStatus> get wifiConnectivity;

  Future<ConnectivityStatus> checkWifiConnectivity();
}
