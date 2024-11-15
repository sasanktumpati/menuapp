import 'package:permission_handler/permission_handler.dart';

import 'perm_type.dart';

class PermissionManager {
  PermissionType? _permissionType;

  // to handle perm denied
  Function()? _onPermissionDenied;

  // to handle perm granted
  Function()? _onPermissionGranted;

  // to handle perm permantly denied
  Function()? _onPermissionPermanentlyDenied;

  PermissionManager(PermissionType permissionType) {
    _permissionType = permissionType;
  }

  PermissionManager onPermissionDenied(Function()? onPermissionDenied) {
    _onPermissionDenied = onPermissionDenied;

    return this;
  }

  PermissionManager onPermissionGranted(Function()? onPermissionGranted) {
    _onPermissionGranted = onPermissionGranted;

    return this;
  }

  PermissionManager onPermissionPermanentlyDenied(
      Function()? onPermissionPermanentlyDenied) {
    _onPermissionPermanentlyDenied = onPermissionPermanentlyDenied;

    return this;
  }

  Permission _getPermissionfromTypes(PermissionType permissionType) {
    switch (permissionType) {
      case PermissionType.sendnotifications:
        return Permission.notification;
      case PermissionType.ignoreBatteryOptimizations:
        return Permission.ignoreBatteryOptimizations;
      case PermissionType.test:
        return Permission.ignoreBatteryOptimizations;
    }
  }

  void getPermission() async {
    Permission permission = _getPermissionfromTypes(_permissionType!);

    await permission.request();

    PermissionStatus status = await permission.status;

    if (status.isGranted && _onPermissionGranted != null) {
      _onPermissionGranted!();
    } else if (status.isDenied && _onPermissionDenied != null) {
      _onPermissionDenied!();
    } else if (status.isPermanentlyDenied &&
        _onPermissionPermanentlyDenied != null) {
      _onPermissionPermanentlyDenied!();
    }
  }
}
