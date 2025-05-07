import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oso/commons/constants/colors.dart';

class OInputTheme {
  OInputTheme._();

  static final InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
    gapPadding: 8.0,
  );

  static InputDecorationTheme lightInputTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: OAppColors.secondaryColor,
    suffixIconColor: OAppColors.secondaryColor,
    border: inputBorder,
    focusedBorder: inputBorder.copyWith(
      borderSide: BorderSide(color: OAppColors.secondaryColor, width: 1),
    ),
    enabledBorder: inputBorder.copyWith(
      borderSide: BorderSide(color: OAppColors.secondaryColor, width: 1),
    ),
    focusedErrorBorder: inputBorder.copyWith(
      borderSide: BorderSide(color: Colors.black12, width: 1),
    ),
    errorBorder: inputBorder.copyWith(
      borderSide: BorderSide(color: OAppColors.error, width: 1),
    ),
    outlineBorder: BorderSide(color: OAppColors.secondaryColor, width: 1),
    labelStyle: GoogleFonts.poppins().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    hintStyle: GoogleFonts.poppins().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    helperStyle: GoogleFonts.poppins().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: GoogleFonts.poppins().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );




  static InputDecorationTheme darkInputTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: OAppColors.secondaryColorDark,
    suffixIconColor: OAppColors.secondaryColorDark,
    border: inputBorder,
    focusedBorder: inputBorder.copyWith(
      borderSide: BorderSide(color: OAppColors.secondaryColorDark, width: 1),
    ),
    enabledBorder: inputBorder.copyWith(
      borderSide: BorderSide(color: OAppColors.secondaryColorDark, width: 1),
    ),
    focusedErrorBorder: inputBorder.copyWith(
      borderSide: BorderSide(color: Colors.black12, width: 1),
    ),
    errorBorder: inputBorder.copyWith(
      borderSide: BorderSide(color: OAppColors.error, width: 1),
    ),
    outlineBorder: BorderSide(color: OAppColors.secondaryColorDark, width: 1),
    labelStyle: GoogleFonts.poppins().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    hintStyle: GoogleFonts.poppins().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    helperStyle: GoogleFonts.poppins().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: GoogleFonts.poppins().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}