import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oso/commons/constants/colors.dart';


class OAppBar {
  OAppBar._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: OAppColors.primaryColor,
    surfaceTintColor: OAppColors.primaryColor,
    iconTheme: IconThemeData(color: OAppColors.secondaryColor, size: 24),
    actionsIconTheme: IconThemeData(color: OAppColors.secondaryColor, size: 24),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: OAppColors.secondaryColor,
    ),
  );


  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: OAppColors.primaryColorDark,
    surfaceTintColor: OAppColors.primaryColorDark,
    iconTheme: IconThemeData(color: OAppColors.secondaryColorDark, size: 24),
    actionsIconTheme: IconThemeData(color: OAppColors.secondaryColorDark, size: 24),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: OAppColors.secondaryColorDark,
    ),
  );
}