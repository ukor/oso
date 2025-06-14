import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:oso/app/service_locators/main.dart';
import 'package:oso/modules/activity/views/ongoing_activity.view.dart';

part 'start_activity.state.g.dart';

class StartActivityState = ActivityBaseState with _$StartActivityState;

abstract class ActivityBaseState with Store {
  final _router = locator.get<GoRouter>();

  @readonly
  String _message = "";

  @action
  init() {
    _message = 'Activity message';
  }

  int countdownFrom = 3;

  ActivityBaseState() {
    _streamController = StreamController<int>();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      countdownFrom -= 1;
      if (countdownFrom <= 0) {
        _streamController.sink.add(0);
        _streamController.close(); // Close the stream
        _timer.cancel();
        Future.delayed(Duration(milliseconds: 150), () {});
        _router.go(OngoingActivityScreen.route.path);
      } else {
        _streamController.sink.add(countdownFrom);
      }
    });

    randomStream = ObservableStream(_streamController.stream);
  }

  late final Timer _timer;

  late final StreamController<int> _streamController;

  late final ObservableStream<int?> randomStream;

  @action
  onIncrement() {
    countdownFrom += 10;
  }

  // ignore: avoid_void_async
  void dispose() async {
    _timer.cancel();
    await _streamController.close();
  }
}
