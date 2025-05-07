import 'package:flutter/material.dart';

extension OAppBuildContext on BuildContext {
  ///
  /// [context] - BuildContext
  ///
  /// [fraction] - double between 0 and 100
  ///
  double widthWithPercent(double width) {
    double fraction = width / 100;

    return MediaQuery.of(this).size.width * fraction;
  }

  ///
  /// [context] - BuildContext
  ///
  /// [fraction] - double between 0 and 100
  ///
  double heightWithPercent(double height) {
    double fraction = height / 100;

    return MediaQuery.of(this).size.height * fraction;
  }

  double heightFromParent(double parentPercentageHeight, double height) {
    double fraction = height / 100;

    double parentHeight =
        MediaQuery.of(this).size.height * (parentPercentageHeight / 100);

    return parentHeight * fraction;
  }

  double widthFromParent(
    double parentPercentageWidth,
    double childPercentageWidth,
  ) {
    double fraction = childPercentageWidth / 100;

    double parentWidth =
        MediaQuery.of(this).size.width * (parentPercentageWidth / 100);

    return parentWidth * fraction;
  }

  TextTheme get textTheme => Theme.of(this).textTheme;
  InputDecorationTheme get inputTheme => Theme.of(this).inputDecorationTheme;
  ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;
}
