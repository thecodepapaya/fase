import 'package:fase/domain/services/services.dart';

import '../../../device/repositories/wifi_info/wifi_info.dart';

abstract class FWifiInfoService implements FService {
  FWifiInfoService._();

  static final instance = FWifiInfoServiceImpl();

  Future<String?> get wifiName;
  Future<String?> get wifiBSSID;
  Future<String?> get wifiIP;
  Future<String?> get wifiIPv6;
  Future<String?> get wifiSubmask;
  Future<String?> get wifiBroadcast;
  Future<String?> get wifiGateway;
}
