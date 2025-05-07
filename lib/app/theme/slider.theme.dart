import 'package:flutter/material.dart';
import 'package:oso/commons/constants/colors.dart';

class OSlider {
  OSlider._();

  static final lightSliderTheme = SliderThemeData(
    activeTrackColor: OAppColors.primaryColor,
    thumbColor: OAppColors.primaryColor,
    valueIndicatorColor: OAppColors.primaryColor,
  );


  static final darkSliderTheme = SliderThemeData(
    activeTrackColor: OAppColors.primaryColorDark,
    thumbColor: OAppColors.primaryColorDark,
    valueIndicatorColor: OAppColors.primaryColorDark,
  );
}