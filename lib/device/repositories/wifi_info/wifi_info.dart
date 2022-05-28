import 'package:network_info_plus/network_info_plus.dart';

import '../../../domain/services/wifi_info/wifi_info_service.dart';

class FWifiInfoServiceImpl implements FWifiInfoService {
  late final NetworkInfo _wifiInfo;

  @override
  Future<String?> get wifiName => _wifiInfo.getWifiName(); // FooNetwork;

  @override
  Future<String?> get wifiBSSID => _wifiInfo.getWifiBSSID(); // 11:22:33:44:55:66

  @override
  Future<String?> get wifiIP => _wifiInfo.getWifiIP(); // 192.168.1.43;

  @override
  Future<String?> get wifiIPv6 => _wifiInfo.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334;

  @override
  Future<String?> get wifiSubmask => _wifiInfo.getWifiSubmask(); // 255.255.255.0;

  @override
  Future<String?> get wifiBroadcast => _wifiInfo.getWifiBroadcast(); // 192.168.1.255;

  @override
  Future<String?> get wifiGateway => _wifiInfo.getWifiGatewayIP(); // 192.168.1.1;

  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    // Do nothing
  }

  @override
  Future<void> startUp() async {
    _wifiInfo = NetworkInfo();
  }
}
