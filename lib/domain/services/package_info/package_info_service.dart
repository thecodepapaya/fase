import 'package:fase/device/repositories/package_info/package_info.dart';

import '../services.dart';

abstract class FPackageInfoService implements FService {
  FPackageInfoService._();

  static final instance = FPackageInfoServiceImpl();

  String get appName;
  String get packageName;
  String get version;
  String get buildNumber;
}
