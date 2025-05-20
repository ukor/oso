import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

enum AppPermissionStatus { granted, notGranted }

class PermissionService {
  final _log = Logger();

  Future<void> requestForAllNecessaryPermissions() async {
    await requestNotificationPermission();

    await requestLocationPermission();
  }

  AppPermissionStatus _isGrated(PermissionStatus ps) {
    final isGrated = ps.isGranted;
    if (isGrated) {
      return AppPermissionStatus.granted;
    }

    return AppPermissionStatus.notGranted;
  }

  Future<bool> isNotificationPermissionGranted() async {
    const permission = Permission.location;

    final status = await permission.status;

    return status.isGranted;
  }

  Future<bool> isLocationPermissionGranted() async {
    const locationPermission = Permission.location;

    final status = await locationPermission.status;

    return status.isGranted;
  }

  Future<AppPermissionStatus> requestLocationPermission() async {
    const locationPermission = Permission.location;

    await locationPermission.shouldShowRequestRationale;

    final status = await locationPermission.status;

    _log.d(status.name);

    if (status.isPermanentlyDenied) {
      final opened = await openAppSettings();
    }

    if (status.isDenied) {
      // We haven't asked for permission yet or the permission has been denied before, but not permanently.
      final request = await locationPermission.request();

      _log.d('request from denied ${request.name}');

      if (request.isPermanentlyDenied) {
        final opened = await openAppSettings();
        _log.d('open app settings in denied $opened');
      }

      _log.d('request from denied after open app settings ${request.name}');

      return _isGrated(request);
    }

    // You can also directly ask permission about its status.
    if (status.isRestricted) {
      // The OS restricts access, for example, because of parental controls.
      final request = await locationPermission.request();

      _log.d('request from restricted ${request.name}');

      return _isGrated(request);
    }

    _log.d('end ${status.name}');

    return _isGrated(status);
  }

  Future<AppPermissionStatus> requestNotificationPermission() async {
    const permission = Permission.notification;

    await permission.shouldShowRequestRationale;

    final status = await permission.status;

    _log.d("notification ${status.name}");

    if (status.isPermanentlyDenied) {
      final opened = await openAppSettings();
    }

    if (status.isDenied) {
      // We haven't asked for permission yet or the permission has been denied before, but not permanently.
      final request = await permission.request();

      _log.d('notification request from denied ${request.name}');

      if (request.isPermanentlyDenied) {
        final opened = await openAppSettings();
        _log.d('notification open app settings in denied $opened');
      }

      _log.d(
        'notification request from denied after open app settings ${request.name}',
      );

      return _isGrated(request);
    }

    // You can also directly ask permission about its status.
    if (status.isRestricted) {
      // The OS restricts access, for example, because of parental controls.
      final request = await permission.request();

      _log.d('notification request from restricted ${request.name}');

      return _isGrated(request);
    }

    _log.d('notification permission request end ${status.name}');

    return _isGrated(status);
  }
}
