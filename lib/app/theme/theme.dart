import 'package:flutter/material.dart';
import 'package:oso/app/theme/app_bar.theme.dart';
import 'package:oso/app/theme/bottom_sheet.theme.dart';
import 'package:oso/app/theme/button.theme.dart';
import 'package:oso/app/theme/check_box.theme.dart';
import 'package:oso/app/theme/chip.theme.dart';
import 'package:oso/app/theme/drop_down_menu.theme.dart';
import 'package:oso/app/theme/input.theme.dart';
import 'package:oso/app/theme/slider.theme.dart';
import 'package:oso/app/theme/text.theme.dart';

import 'package:oso/commons/constants/colors.dart';

class OAppTheme {
  OAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,

    // primaryColor: OAppColors.primaryColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: OAppColors.primaryColor,
      onPrimary: OAppColors.secondaryColor,
      secondary: OAppColors.secondaryColor,
      onSecondary: OAppColors.primaryColor,
      error: OAppColors.error,
      onError: OAppColors.white,
      surface: OAppColors.secondaryColor,
      onSurface: OAppColors.primaryColor,
    ),
    scaffoldBackgroundColor: OAppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: OAppColors.primaryShade4,
    ),
    textTheme: OTextTheme.lightTextTheme,
    inputDecorationTheme: OInputTheme.lightInputTheme,
    elevatedButtonTheme: OButton.lightElevatedButton,
    outlinedButtonTheme: OButton.lightOutlinedButton,
    floatingActionButtonTheme: OButton.lightFloatingAction,
    iconButtonTheme: OButton.lightIconButton,
    dropdownMenuTheme: ODropDownMenu.lightDropdownButton,
    appBarTheme: OAppBar.lightAppBarTheme,
    bottomSheetTheme: OBottomSheet.lightBottomSheetTheme,
    checkboxTheme: OCheckBox.lightCheckBoxTheme,
    chipTheme: OChipTheme.lightChipTheme,
    sliderTheme: OSlider.lightSliderTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: OAppColors.primaryColorDark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: OAppColors.primaryColorDark,
      brightness: Brightness.dark,
    ),
    textTheme: OTextTheme.darkTextTheme,
    inputDecorationTheme: OInputTheme.darkInputTheme,
    elevatedButtonTheme: OButton.lightElevatedButton,
    outlinedButtonTheme: OButton.lightOutlinedButton,
    iconButtonTheme: OButton.lightIconButton,
    dropdownMenuTheme: ODropDownMenu.darkDropdownButton,
    appBarTheme: OAppBar.darkAppBarTheme,
    bottomSheetTheme: OBottomSheet.darkBottomSheetTheme,
    checkboxTheme: OCheckBox.darkCheckBoxTheme,
    chipTheme: OChipTheme.darkChipTheme,
    sliderTheme: OSlider.darkSliderTheme,
  );
}
