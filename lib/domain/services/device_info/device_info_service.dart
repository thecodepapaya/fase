import '../../../device/repositories/device_info/device_info.dart';
import '../services.dart';

abstract class FDeviceInfoService implements FService {
  FDeviceInfoService._();

  static final instance = FDeviceInfoServiceImpl();

  String? get model;
  String? get brand;
  String? get type;
  String? get id;
  String? get device;
  String? get tags;
  String? get sdk;
  String? get os;
  String? get osVersion;
}
