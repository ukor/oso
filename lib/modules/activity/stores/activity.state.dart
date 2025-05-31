import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:oso/app/service_locators/main.dart';
import 'package:oso/modules/activity/views/start_activity.view.dart';

part 'activity.state.g.dart';

class ActivityState = ActivityBaseState with _$ActivityState;

abstract class ActivityBaseState with Store {
  final _router = locator.get<GoRouter>();

  @readonly
  String _message = "";

  @action
  init() {
    _message = 'Activity message';
  }

  onStart() {
    return _router.go(StartActivityScreen.route.path);
  }
}
