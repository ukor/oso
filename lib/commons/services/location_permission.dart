import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

enum LocationPermissionStatus { granted, notGranted }

class LocationPermissionService {
  final _log = Logger();

  LocationPermissionStatus _isGrated(PermissionStatus ps) {
    final isGrated = ps.isGranted;
    if (isGrated) {
      return LocationPermissionStatus.granted;
    }

    return LocationPermissionStatus.notGranted;
  }

  Future<LocationPermissionStatus> getPermission() async {
    final locationPermission = Permission.location;

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
}
