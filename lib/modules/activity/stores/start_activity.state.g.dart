// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_activity.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartActivityState on ActivityBaseState, Store {
  late final _$_messageAtom =
      Atom(name: 'ActivityBaseState._message', context: context);

  String get message {
    _$_messageAtom.reportRead();
    return super._message;
  }

  @override
  String get _message => message;

  @override
  set _message(String value) {
    _$_messageAtom.reportWrite(value, super._message, () {
      super._message = value;
    });
  }

  late final _$ActivityBaseStateActionController =
      ActionController(name: 'ActivityBaseState', context: context);

  @override
  dynamic init() {
    final _$actionInfo = _$ActivityBaseStateActionController.startAction(
        name: 'ActivityBaseState.init');
    try {
      return super.init();
    } finally {
      _$ActivityBaseStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onIncrement() {
    final _$actionInfo = _$ActivityBaseStateActionController.startAction(
        name: 'ActivityBaseState.onIncrement');
    try {
      return super.onIncrement();
    } finally {
      _$ActivityBaseStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
