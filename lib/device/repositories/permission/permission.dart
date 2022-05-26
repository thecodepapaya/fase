import 'package:permission_handler/permission_handler.dart';

import '../../../domain/services/permission/permission_service.dart';

class FPermissionServiceImpl implements FPermissionService {
  @override
  void onShutDown() {
    // Do nothing
  }

  @override
  Future<void> onStartUp(dynamic data) async {
    await Permission.locationWhenInUse.request();

    return;
  }

  @override
  Future<void> startUp() async {
    // DO nothing
  }

  @override
  Future<PermissionStatus> permissionStatus(Permission permission) async {
    final status = await permission.status;

    return status;
  }

  @override
  Future<PermissionStatus> requestPermission(Permission permission) async {
    final status = await permission.request();

    return status;
  }

  @override
  Future<void> openSettings() async {
    await openAppSettings();
  }
}
