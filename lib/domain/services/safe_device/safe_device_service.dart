import 'package:fase/device/repositories/safe_device/safe_device.dart';
import 'package:fase/domain/services/services.dart';

abstract class FSafeDeviceService implements FService {
  FSafeDeviceService._();

  static final instance = FSafeDeviceServiceImpl();

  bool get isRooted;
  bool get isRealDevice;
  bool get canMockLocation;
  bool get isDevelopmentDevice;
}
