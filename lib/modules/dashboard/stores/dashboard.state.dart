import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:oso/app/service_locators/main.dart';
import 'package:oso/commons/services/location.service.dart';
import 'package:oso/commons/services/permission.service.dart';

part 'dashboard.state.g.dart';

class DashboardState = DashboardBaseState with _$DashboardState;

abstract class DashboardBaseState with Store {
  final _locationPermissionService = locator.get<PermissionService>();

  final _locationService = locator.get<LocationService>();

  final _log = Logger();

  @readonly
  String _message = "";

  late StreamSubscription<Position> positionStream;

  @action
  init() {
    _message = 'Dashboard message';

    _log.d(_message);

    _locationPermissionService
        .requestForAllNecessaryPermissions()
        .then((p) {
          _log.d('location permission');
        })
        .catchError((e, s) {
          _log.e(e, stackTrace: s);
        });

    positionStream = _locationService.getLocationContinuously().listen((p) {
      _log.i(
        'PositionStream -> lat = ${p.latitude}, long = ${p.longitude}, altitude = ${p.altitude}, speed = ${p.speed}',
      );
    });

    positionStream.onError((e, stakeTrace) {
      _log.f(e, stackTrace: stakeTrace);
    });

    positionStream.onDone(() {
      _log.d('Position stream is done');
    });
  }

  @action
  dispose() {
    positionStream.cancel();
  }
}
