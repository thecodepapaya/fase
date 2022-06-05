import 'package:fase/app/globals.dart';
import 'package:fase/domain/entities/registration.dart';
import 'package:fase/domain/repositories/registration_repository.dart';
import 'package:fase/domain/services/device_info/device_info_service.dart';
import 'package:fase/domain/services/package_info/package_info_service.dart';
import 'package:fase/domain/services/safe_device/safe_device_service.dart';
import 'package:fase/domain/services/wifi_info/wifi_info_service.dart';
import 'package:fase/domain/usecases/registration_usecases.dart';

class RegistrationUsecaseImpl implements RegistrationUsecase {
  @override
  Future<Registration?> registerUser() async {
    final registrationData = Registration(
      appBuildNumber: int.tryParse(FPackageInfoService.instance.buildNumber) ?? 1,
      appVersionString: FPackageInfoService.instance.version,
      brand: FDeviceInfoService.instance.brand,
      bssid: (await FWifiInfoService.instance.wifiBSSID) ?? '',
      ssid: (await FWifiInfoService.instance.wifiName) ?? '',
      localIp: (await FWifiInfoService.instance.wifiIP) ?? '',
      deviceId: FDeviceInfoService.instance.id,
      deviceName: FDeviceInfoService.instance.deviceName,
      model: FDeviceInfoService.instance.model,
      os: FDeviceInfoService.instance.os,
      osVersion: FDeviceInfoService.instance.osVersion,
      isPhysical: FSafeDeviceService.instance.isRealDevice,
      isRooted: FSafeDeviceService.instance.isRooted,
      student: Globals.profile.instituteEmail,
    );

    final registration = await RegistrationRepository.instance.register(registrationData);

    return registration;
  }

  @override
  Future<bool> verifyUserRegistration() async {
    final deviceID = FDeviceInfoService.instance.id;

    final registration = await RegistrationRepository.instance.verifyRegistration(deviceID);

    final isRegistrationValid = registration != null;

    if (isRegistrationValid) {
      Globals.registration = registration;
    }

    return isRegistrationValid;
  }
}
