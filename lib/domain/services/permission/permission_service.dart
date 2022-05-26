import 'package:permission_handler/permission_handler.dart';

import '../../../device/repositories/permission/permission.dart';
import '../services.dart';

abstract class FPermissionService implements FService {
  FPermissionService._();

  static final instance = FPermissionServiceImpl();

  Future<PermissionStatus> requestPermission(Permission permission);

  Future<PermissionStatus> permissionStatus(Permission permission);

  Future<void> openSettings();
}
