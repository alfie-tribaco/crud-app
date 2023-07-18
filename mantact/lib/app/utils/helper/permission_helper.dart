import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  Future<void> requestPermission(Permission permission) async {
    final status = await permission.status;
    if (status.isDenied) {
      await permission.request();
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    } else {}
  }

  Future<void> askPermissions(List<Permission> permissions) async {
    for (final permission in permissions) {
      await requestPermission(permission);
    }
  }
}
