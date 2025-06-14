import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:oso/app/service_locators/main.dart';
import 'package:oso/commons/dtos/coordinate.dto.dart';
import 'package:oso/commons/services/location.service.dart';
import 'package:oso/modules/activity/views/activity.view.dart';

part 'ongoing_activity.state.g.dart';

class OngoingActivityState = OngoingActivityBaseState
    with _$OngoingActivityState;

abstract class OngoingActivityBaseState with Store {
  final _router = locator.get<GoRouter>();

  final _log = Logger();

  final _locationService = locator.get<LocationService>();

  @readonly
  String _message = "";

  @readonly
  int _counter = 0;

  @readonly
  int _seconds = 0;

  @readonly
  int _minutes = 0;

  @readonly
  int _hours = 0;

  @readonly
  double _pace = 00.00;

  @readonly
  double _calories = 0;

  @readonly
  double _distance = 0.00;

  @readonly
  ObservableList<CoordinateDto> _positions = ObservableList.of([]);

  @readonly
  String _coordinate = '';

  @action
  init() {
    _message = 'Activity message';

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _counter += 1;
      if (_seconds == 59) {
        _seconds = 00;
        if (_minutes == 59) {
          _minutes = 00;
          _hours += 1;
        } else {
          _minutes += 1;
        }
      } else {
        _seconds += 1;
      }
    });

    _locationService
        .getLocationContinuously()
        .listen((position) {
          _log.i(position);
          _pace = position.speed;

          _distance = position.altitude;

          _coordinate =
              'longitude: ${position.longitude} latitude: ${position.latitude}';

          _positions.add(
            CoordinateDto(
              longitude: position.longitude,
              latitude: position.latitude,
            ),
          );
        })
        .onError((error) {
          _log.f(error);
        });
  }

  late final Timer _timer;

  late final ObservableStream<int?> randomStream;

  @action
  onDone() {
    return _router.go(ActivityScreen.route.path);
  }

  // ignore: avoid_void_async
  void dispose() async {
    _timer.cancel();
  }
}
