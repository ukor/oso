import 'package:mobx/mobx.dart';

part 'example.state.g.dart';

class ExampleState = ExampleBaseState with _$ExampleState;

abstract class ExampleBaseState with Store {
  @readonly
  String _message = "";

  @action
  init() {
    _message = 'Example message';
  }
}
