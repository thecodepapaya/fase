import 'package:fase/domain/services/services.dart';

import '../../../device/repositories/wifi_info/wifi_info.dart';

abstract class FWifiInfoService implements FService {
  FWifiInfoService._();

  static final instance = FWifiInfoServiceImpl();

  String? get wifiName;
  String? get wifiBSSID;
  String? get wifiIP;
  String? get wifiIPv6;
  String? get wifiSubmask;
  String? get wifiBroadcast;
  String? get wifiGateway;
}
