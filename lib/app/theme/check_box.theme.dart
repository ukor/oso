import 'package:flutter/material.dart';
import 'package:oso/commons/constants/colors.dart';

class OCheckBox {
  OCheckBox._();

  static final CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
      side: BorderSide(
        color: OAppColors.secondaryColor,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    side: BorderSide(
      color: OAppColors.secondaryColor,
      width: 1,
      style: BorderStyle.solid,
    ),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return OAppColors.secondaryColor;
      } else {
        return OAppColors.transparent;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return OAppColors.primaryColor;
      } else {
        return OAppColors.transparent;
      }
    }),
  );

  static final CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    side: BorderSide(color: OAppColors.secondaryColor, width: 1),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return OAppColors.secondaryColorDark;
      } else {
        return OAppColors.transparent;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return OAppColors.primaryColorDark;
      } else {
        return OAppColors.transparent;
      }
    }),
  );
}
