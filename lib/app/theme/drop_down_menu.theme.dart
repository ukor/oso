import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oso/app/theme/input.theme.dart';
import 'package:oso/commons/constants/colors.dart';

class ODropDownMenu {
  ODropDownMenu._();

  static final lightDropdownButton = DropdownMenuThemeData(
    menuStyle: MenuStyle(
      elevation: WidgetStatePropertyAll(0),

      backgroundColor: WidgetStatePropertyAll(OAppColors.primaryColor),

      side: WidgetStatePropertyAll(BorderSide(color: OAppColors.secondaryColor)),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      ),

      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    inputDecorationTheme: OInputTheme.lightInputTheme,
    textStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: OAppColors.secondaryColor,
    ),
  );


  static final darkDropdownButton = DropdownMenuThemeData(
    menuStyle: MenuStyle(
      elevation: WidgetStatePropertyAll(0),

      backgroundColor: WidgetStatePropertyAll(OAppColors.primaryColorDark),

      side: WidgetStatePropertyAll(BorderSide(color: OAppColors.secondaryColorDark)),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      ),

      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    inputDecorationTheme: OInputTheme.darkInputTheme,
    textStyle: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: OAppColors.secondaryColorDark,
    ),
  );
}