import 'package:mobx/mobx.dart';

part 'activity.state.g.dart';

class ActivityState = ActivityBaseState with _$ActivityState;

abstract class ActivityBaseState with Store {
  @readonly
  String _message = "";

  @action
  init() {
    _message = 'Activity message';
  }
}
