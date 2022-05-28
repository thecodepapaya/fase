import 'package:permission_handler/permission_handler.dart';

import '../../app/utils/ap_list.dart';
import '../../device/repositories/connectivity/connectivity.dart';
import '../../domain/services/connectivity/connectivity_service.dart';
import '../../domain/services/permission/permission_service.dart';
import '../../domain/services/safe_device/safe_device_service.dart';
import '../../domain/services/wifi_info/wifi_info_service.dart';
import '../../domain/usecases/startup_check_usecase.dart';

class StartUpCheckUsecaseImpl implements StartUpCheckUsecase {
  @override
  Future<bool> checkAppUpToDate() {
    // TODO: implement checkRegistrationValid
    return Future.value(true);
  }

  @override
  Future<bool> checkCanPingServer() {
    // TODO: implement checkCanPingServer
    return Future.value(true);
  }

  @override
  Future<bool> checkRegistrationValid() {
    // TODO: implement checkRegistrationValid
    return Future.value(true);
  }

  @override
  Future<bool> checkIfLocationEnabled() async {
    final isLocationEnabled = await Permission.locationWhenInUse.serviceStatus.isEnabled;

    return isLocationEnabled;
  }

  @override
  Future<bool> checkIfLocationGranted() async {
    const locationPermission = Permission.locationWhenInUse;
    late final bool isLocationPermissionGranted;

    final permissionStatus = await FPermissionService.instance.permissionStatus(locationPermission);

    isLocationPermissionGranted = permissionStatus.isGranted || permissionStatus.isLimited;

    return isLocationPermissionGranted;
  }

  @override
  Future<bool> checkIfPhysicalDevice() async {
    late final bool isPhysicalDevice;

    isPhysicalDevice = FSafeDeviceService.instance.isRealDevice;

    return isPhysicalDevice;
  }

  @override
  Future<bool> checkIfUnRooted() async {
    late final bool isDeviceUnRooted;

    isDeviceUnRooted = !FSafeDeviceService.instance.isRooted;

    return isDeviceUnRooted;
  }

  @override
  Future<bool> checkIfWifiConnected() async {
    late final bool isWifiConnected;

    final connectivityStatus = await FConnectivityService.instance.checkWifiConnectivity();
    isWifiConnected = connectivityStatus == ConnectivityStatus.wifiConnected;

    return isWifiConnected;
  }

  @override
  Future<bool> checkIfIIITVWifiConnected() async {
    final currentBSSID = await FWifiInfoService.instance.wifiBSSID;

    final isConnectedToIIITVAP = AccessPoints.list.contains(currentBSSID);

    return isConnectedToIIITVAP;
  }
}
