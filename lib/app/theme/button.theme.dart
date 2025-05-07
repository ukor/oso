import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oso/commons/constants/colors.dart';

class OButton {
  OButton._();

  static final lightElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: OAppColors.primaryColor,
      backgroundColor: OAppColors.secondaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: OAppColors.primaryShade4,
      side: BorderSide(color: OAppColors.secondaryColor),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      textStyle: GoogleFonts.poppins().copyWith(
        fontSize: 16,
        color: OAppColors.primaryColor,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );

  static final lightOutlinedButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: OAppColors.primaryColor,
      backgroundColor: OAppColors.secondaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: OAppColors.primaryShade4,
      side: BorderSide(color: OAppColors.secondaryColor),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      textStyle: GoogleFonts.poppins().copyWith(
        fontSize: 16,
        color: OAppColors.primaryColor,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );

  static final lightIconButton = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: OAppColors.primaryColor,
      backgroundColor: OAppColors.secondaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: OAppColors.primaryShade4,
      side: BorderSide(width: 0, style: BorderStyle.none),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      iconSize: 24,
      shape: CircleBorder(side: BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );

  static final lightFloatingAction = FloatingActionButtonThemeData(
    backgroundColor: OAppColors.secondaryColor,
    foregroundColor: OAppColors.primaryColor,
    splashColor: OAppColors.primaryShade4,
  );

  ///
  /// Dark Theme
  ///

  static final darkElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: OAppColors.secondaryColorDark,
      backgroundColor: OAppColors.primaryColorDark,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: OAppColors.primaryShade4,
      side: BorderSide(color: OAppColors.primaryColorDark),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      textStyle: GoogleFonts.poppins().copyWith(
        fontSize: 16,
        color: OAppColors.secondaryColorDark,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );

  static final darkOutlinedButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: OAppColors.secondaryColorDark,
      backgroundColor: OAppColors.primaryColorDark,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: OAppColors.primaryShade4,
      side: BorderSide(color: OAppColors.secondaryColorDark),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      textStyle: GoogleFonts.poppins().copyWith(
        fontSize: 16,
        color: OAppColors.secondaryColor,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );

  static final darkIconButton = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: OAppColors.secondaryColorDark,
      backgroundColor: OAppColors.primaryColorDark,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: OAppColors.primaryShade4,
      side: BorderSide(width: 0, style: BorderStyle.none),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      iconSize: 24,
      shape: CircleBorder(side: BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );

  static final darkFloatingAction = FloatingActionButtonThemeData(
    backgroundColor: OAppColors.secondaryColorDark,
    foregroundColor: OAppColors.primaryColorDark,
    splashColor: OAppColors.primaryShade1,
  );
}
