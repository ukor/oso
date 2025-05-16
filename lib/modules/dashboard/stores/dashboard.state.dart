import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:oso/app/service_locators/main.dart';
import 'package:oso/commons/services/location_permission.dart';

part 'dashboard.state.g.dart';

class DashboardState = DashboardBaseState with _$DashboardState;

abstract class DashboardBaseState with Store {
  final _locationPermissionService = locator.get<LocationPermissionService>();

  final _log = Logger();

  @readonly
  String _message = "";

  @action
  init() {
    _message = 'Dashboard message';

    _log.d(_message);

    _locationPermissionService
        .getPermission()
        .then((LocationPermissionStatus p) {
          // TODO - do something
          _log.d('location permission ${p.name}');
        })
        .catchError((e, s) {
          _log.e(e, stackTrace: s);
        });
  }
}
