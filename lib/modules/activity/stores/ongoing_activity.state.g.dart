// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ongoing_activity.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OngoingActivityState on OngoingActivityBaseState, Store {
  late final _$_messageAtom =
      Atom(name: 'OngoingActivityBaseState._message', context: context);

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

  late final _$_counterAtom =
      Atom(name: 'OngoingActivityBaseState._counter', context: context);

  int get counter {
    _$_counterAtom.reportRead();
    return super._counter;
  }

  @override
  int get _counter => counter;

  @override
  set _counter(int value) {
    _$_counterAtom.reportWrite(value, super._counter, () {
      super._counter = value;
    });
  }

  late final _$_secondsAtom =
      Atom(name: 'OngoingActivityBaseState._seconds', context: context);

  int get seconds {
    _$_secondsAtom.reportRead();
    return super._seconds;
  }

  @override
  int get _seconds => seconds;

  @override
  set _seconds(int value) {
    _$_secondsAtom.reportWrite(value, super._seconds, () {
      super._seconds = value;
    });
  }

  late final _$_minutesAtom =
      Atom(name: 'OngoingActivityBaseState._minutes', context: context);

  int get minutes {
    _$_minutesAtom.reportRead();
    return super._minutes;
  }

  @override
  int get _minutes => minutes;

  @override
  set _minutes(int value) {
    _$_minutesAtom.reportWrite(value, super._minutes, () {
      super._minutes = value;
    });
  }

  late final _$_hoursAtom =
      Atom(name: 'OngoingActivityBaseState._hours', context: context);

  int get hours {
    _$_hoursAtom.reportRead();
    return super._hours;
  }

  @override
  int get _hours => hours;

  @override
  set _hours(int value) {
    _$_hoursAtom.reportWrite(value, super._hours, () {
      super._hours = value;
    });
  }

  late final _$_paceAtom =
      Atom(name: 'OngoingActivityBaseState._pace', context: context);

  double get pace {
    _$_paceAtom.reportRead();
    return super._pace;
  }

  @override
  double get _pace => pace;

  @override
  set _pace(double value) {
    _$_paceAtom.reportWrite(value, super._pace, () {
      super._pace = value;
    });
  }

  late final _$_caloriesAtom =
      Atom(name: 'OngoingActivityBaseState._calories', context: context);

  double get calories {
    _$_caloriesAtom.reportRead();
    return super._calories;
  }

  @override
  double get _calories => calories;

  @override
  set _calories(double value) {
    _$_caloriesAtom.reportWrite(value, super._calories, () {
      super._calories = value;
    });
  }

  late final _$_distanceAtom =
      Atom(name: 'OngoingActivityBaseState._distance', context: context);

  double get distance {
    _$_distanceAtom.reportRead();
    return super._distance;
  }

  @override
  double get _distance => distance;

  @override
  set _distance(double value) {
    _$_distanceAtom.reportWrite(value, super._distance, () {
      super._distance = value;
    });
  }

  late final _$_positionsAtom =
      Atom(name: 'OngoingActivityBaseState._positions', context: context);

  ObservableList<CoordinateDto> get positions {
    _$_positionsAtom.reportRead();
    return super._positions;
  }

  @override
  ObservableList<CoordinateDto> get _positions => positions;

  @override
  set _positions(ObservableList<CoordinateDto> value) {
    _$_positionsAtom.reportWrite(value, super._positions, () {
      super._positions = value;
    });
  }

  late final _$_coordinateAtom =
      Atom(name: 'OngoingActivityBaseState._coordinate', context: context);

  String get coordinate {
    _$_coordinateAtom.reportRead();
    return super._coordinate;
  }

  @override
  String get _coordinate => coordinate;

  @override
  set _coordinate(String value) {
    _$_coordinateAtom.reportWrite(value, super._coordinate, () {
      super._coordinate = value;
    });
  }

  late final _$OngoingActivityBaseStateActionController =
      ActionController(name: 'OngoingActivityBaseState', context: context);

  @override
  dynamic init() {
    final _$actionInfo = _$OngoingActivityBaseStateActionController.startAction(
        name: 'OngoingActivityBaseState.init');
    try {
      return super.init();
    } finally {
      _$OngoingActivityBaseStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDone() {
    final _$actionInfo = _$OngoingActivityBaseStateActionController.startAction(
        name: 'OngoingActivityBaseState.onDone');
    try {
      return super.onDone();
    } finally {
      _$OngoingActivityBaseStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
