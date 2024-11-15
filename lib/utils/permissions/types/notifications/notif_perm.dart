import '../../../logger/log_tags.dart';
import '../../../logger/logger.dart';
import '../../handlers/perm_type.dart';
import '../../handlers/permission_han.dart';

class NotificationPerm {
  Future<void> getnotifcationPermission() async {
    PermissionManager(PermissionType.sendnotifications).onPermissionGranted(() {
      debugLog(
        LogTags.notificationPermission,
        "Permsission Granted",
      );
    }).onPermissionDenied(() {
      debugLog(
        LogTags.notificationPermission,
        "Permsission Denied",
      );
    }).onPermissionPermanentlyDenied(() {
      debugLog(
        LogTags.notificationPermission,
        "Permsission Permanently Denied",
      );
    }).getPermission();
  }

  Future<void> ignoreBatteryOptimizations() async {
    PermissionManager(PermissionType.ignoreBatteryOptimizations)
        .onPermissionGranted(() {
      debugLog(
        LogTags.ignoreBatteryOptimizations,
        "Permsission Granted",
      );
    }).onPermissionDenied(() {
      debugLog(
        LogTags.ignoreBatteryOptimizations,
        "Permsission Denied",
      );
    }).onPermissionPermanentlyDenied(() {
      debugLog(
        LogTags.ignoreBatteryOptimizations,
        "Permsission Permanently Denied",
      );
    }).getPermission();
  }
}
