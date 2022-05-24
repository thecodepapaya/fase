import '../../service.dart';

import 'package:network_info_plus/network_info_plus.dart';

class FWifiInfoService implements FService {
  String? _wifiName;
  String? _wifiBSSID;
  String? _wifiIP;
  String? _wifiIPv6;
  String? _wifiSubmask;
  String? _wifiBroadcast;
  String? _wifiGateway;

  String? get wifiName => _wifiName;
  String? get wifiBSSID => _wifiBSSID;
  String? get wifiIP => _wifiIP;
  String? get wifiIPv6 => _wifiIPv6;
  String? get wifiSubmask => _wifiSubmask;
  String? get wifiBroadcast => _wifiBroadcast;
  String? get wifiGateway => _wifiGateway;

  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future<void> onStartUp() async {
    // Do nothing
  }

  @override
  Future<void> startUp() async {
    final wifiInfo = NetworkInfo();

    _wifiName = await wifiInfo.getWifiName(); // FooNetwork
    _wifiBSSID = await wifiInfo.getWifiBSSID(); // 11:22:33:44:55:66
    _wifiIP = await wifiInfo.getWifiIP(); // 192.168.1.43
    _wifiIPv6 = await wifiInfo.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
    _wifiSubmask = await wifiInfo.getWifiSubmask(); // 255.255.255.0
    _wifiBroadcast = await wifiInfo.getWifiBroadcast(); // 192.168.1.255
    _wifiGateway = await wifiInfo.getWifiGatewayIP(); // 192.168.1.1
  }
}
