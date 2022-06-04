import '../../../device/repositories/device_info/device_info.dart';
import '../services.dart';

abstract class FDeviceInfoService implements FService {
  FDeviceInfoService._();

  static final instance = FDeviceInfoServiceImpl();

  String? get model;
  String? get brand;
  String? get id;
  String? get deviceName;
  String? get os;
  String? get osVersion;
}
