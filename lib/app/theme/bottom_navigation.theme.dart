import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oso/commons/constants/colors.dart';

class OBottomNavigationBar {
  OBottomNavigationBar._();

  static final lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    elevation: 20,
    backgroundColor: OAppColors.primaryColor,

    selectedIconTheme: IconThemeData(color: OAppColors.primaryColor, size: 24),
    unselectedIconTheme: IconThemeData(
      color: OAppColors.secondaryColor,
      size: 24,
    ),

    selectedItemColor: OAppColors.error,
    unselectedItemColor: OAppColors.secondaryColor,

    selectedLabelStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: OAppColors.secondaryColor,
    ),

    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: OAppColors.secondaryColor,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    enableFeedback: true,
  );

  static final darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: OAppColors.primaryColorDark,

    selectedIconTheme: IconThemeData(
      color: OAppColors.secondaryColorDark,
      size: 24,
    ),
    unselectedIconTheme: IconThemeData(
      color: OAppColors.secondaryColorDark,
      size: 24,
    ),

    selectedItemColor: OAppColors.primaryColor,
    unselectedItemColor: OAppColors.secondaryColor,

    selectedLabelStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: OAppColors.secondaryColor,
    ),

    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: OAppColors.secondaryColor,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    enableFeedback: true,
  );
}
