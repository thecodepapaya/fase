import 'package:fase/domain/repositories/meta_data_repository.dart';
import 'package:fase/domain/services/package_info/package_info_service.dart';
import 'package:fase/domain/usecases/auth_usecases.dart';
import 'package:fase/domain/usecases/metadata_usecases.dart';
import 'package:fase/domain/usecases/registration_usecases.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../device/repositories/connectivity/connectivity.dart';
import '../../domain/services/connectivity/connectivity_service.dart';
import '../../domain/services/permission/permission_service.dart';
import '../../domain/services/safe_device/safe_device_service.dart';
import '../../domain/services/wifi_info/wifi_info_service.dart';
import '../../domain/usecases/system_check_usecases.dart';

class SystemCheckUsecaseImpl implements SystemCheckUsecase {
  @override
  Future<bool> checkAppUpToDate() async {
    const maxPossibleBuildNumber = 9223372036854775807;
    final metadata = await MetadataUsecase.instance.getMetadata();

    final minAllowedAppVersion = (metadata?.minAppBuild ?? maxPossibleBuildNumber);
    final currentAppVersion = int.tryParse(FPackageInfoService.instance.buildNumber) ?? 1;
    final isAppUpToDate = currentAppVersion >= minAllowedAppVersion;

    return isAppUpToDate;
  }

  @override
  Future<bool> checkCanPingServer() async {
    final canPing = await MetadataRepository.instance.pingServer();
    return canPing;
  }

  @override
  Future<bool> checkRegistrationValid() async {
    final isRegistrationValid = RegistrationUsecase.instance.verifyUserRegistration();

    return isRegistrationValid;
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
    final bool isConnectedToIIITVAP;
    final currentBSSID = await FWifiInfoService.instance.wifiBSSID ?? '00:00:00:00:00:00';
    final currentBSSIDPrefix = currentBSSID.substring(0, 8);

    final accessPointData = await MetadataRepository.instance.getAccessPointData();

    final hasAccessPointPrefix = accessPointData?.accessPointsPrefix.contains(currentBSSIDPrefix) ?? false;

    isConnectedToIIITVAP = hasAccessPointPrefix;

    return isConnectedToIIITVAP;
  }

  @override
  Future<bool> checkUserLoggedIn() async {
    final user = await AuthUsecase.instance.login();

    final isUserLoggedIn = user != null ? true : false;

    return isUserLoggedIn;
  }
}
