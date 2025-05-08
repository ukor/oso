import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oso/commons/constants/colors.dart';

class OTextTheme {
  OTextTheme._();

  static TextTheme lightTextTheme = GoogleFonts.poppinsTextTheme(
    TextTheme(
      displayLarge: TextStyle().copyWith(color: OAppColors.secondaryColor),
      displayMedium: TextStyle().copyWith(color: OAppColors.secondaryColor),
      displaySmall: TextStyle().copyWith(color: OAppColors.secondaryColor),

      headlineLarge: TextStyle().copyWith(color: OAppColors.secondaryColor),
      headlineMedium: TextStyle().copyWith(color: OAppColors.secondaryColor),
      headlineSmall: TextStyle().copyWith(color: OAppColors.secondaryColor),

      titleLarge: TextStyle().copyWith(color: OAppColors.secondaryColor),
      titleMedium: TextStyle().copyWith(color: OAppColors.secondaryColor),
      titleSmall: TextStyle().copyWith(color: OAppColors.secondaryColor),

      bodyLarge: TextStyle().copyWith(color: OAppColors.secondaryColor),
      bodyMedium: TextStyle().copyWith(color: OAppColors.secondaryColor),
      bodySmall: TextStyle().copyWith(color: OAppColors.secondaryColor),

      labelLarge: TextStyle().copyWith(color: OAppColors.secondaryColor),
      labelMedium: TextStyle().copyWith(color: OAppColors.secondaryColor),
      labelSmall: TextStyle().copyWith(color: OAppColors.secondaryColor),
    ),
  );

  static TextTheme darkTextTheme = GoogleFonts.poppinsTextTheme(
    TextTheme(
      displayLarge: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
      displayMedium: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
      displaySmall: TextStyle().copyWith(color: OAppColors.secondaryColorDark),

      headlineLarge: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
      headlineMedium: TextStyle().copyWith(
        color: OAppColors.secondaryColorDark,
      ),
      headlineSmall: TextStyle().copyWith(color: OAppColors.secondaryColorDark),

      titleLarge: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
      titleMedium: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
      titleSmall: TextStyle().copyWith(color: OAppColors.secondaryColorDark),

      bodyLarge: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
      bodyMedium: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
      bodySmall: TextStyle().copyWith(color: OAppColors.secondaryColorDark),

      labelLarge: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
      labelMedium: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
      labelSmall: TextStyle().copyWith(color: OAppColors.secondaryColorDark),
    ),
  );
}
