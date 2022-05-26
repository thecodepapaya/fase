import 'package:package_info_plus/package_info_plus.dart';

import '../../../domain/services/package_info/package_info_service.dart';

class FPackageInfoServiceImpl implements FPackageInfoService {
  late String _appName;
  late String _packageName;
  late String _version;
  late String _buildNumber;

  @override
  String get appName => _appName;
  @override
  String get packageName => _packageName;
  @override
  String get version => _version;
  @override
  String get buildNumber => _buildNumber;

  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    // Do nothing
    return;
  }

  @override
  Future<void> startUp() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    _appName = packageInfo.appName;
    _packageName = packageInfo.packageName;
    _version = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
  }
}
