import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oso/commons/constants/colors.dart';

class OChipTheme {
  OChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    elevation: 0,
    showCheckmark: true,
    color: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return OAppColors.secondaryColor;
      } else {
        return OAppColors.transparent;
      }
    }),
    disabledColor: Colors.grey.withValues(alpha: 0.4),
    labelStyle: GoogleFonts.poppins().copyWith(color: ChipLabelColorLight()),
    backgroundColor: OAppColors.primaryColor,
    selectedColor: OAppColors.secondaryColor,
    checkmarkColor: OAppColors.primaryColor,
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    side: ChipSideLight(),
  );

  ///
  /// Dark theme
  ///
  static ChipThemeData darkChipTheme = ChipThemeData(
    elevation: 0,
    showCheckmark: false,
    color: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return OAppColors.secondaryColorDark;
      } else {
        return OAppColors.transparent;
      }
    }),
    disabledColor: Colors.grey.withValues(alpha: 0.4),
    labelStyle: GoogleFonts.poppins().copyWith(color: ChipLabelColorDark()),
    backgroundColor: OAppColors.primaryColorDark,
    selectedColor: OAppColors.primaryColorDark,
    checkmarkColor: OAppColors.secondaryColorDark,
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    side: ChipSideDark(),
  );
}

class ChipLabelColorLight extends Color implements WidgetStateColor {
  const ChipLabelColorLight() : super(_default);

  static const int _default = 0xFFffffff;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return OAppColors.primaryColor; // Selected text color
    }
    return OAppColors.primaryColor; // normal text color
  }
}

class ChipSideLight extends BorderSide implements WidgetStateProperty {
  const ChipSideLight() : super();

  @override
  BorderSide resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return BorderSide(color: OAppColors.secondaryColor, width: 1);
    }
    return BorderSide(color: OAppColors.primaryColor, width: 1);
  }
}

class ChipShapeLight extends BorderSide implements WidgetStateProperty {
  const ChipShapeLight() : super();

  @override
  OutlinedBorder resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: OAppColors.secondaryColor, width: 1),
      );
    }
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(color: OAppColors.secondaryColor, width: 1),
    );
  }
}

class ChipLabelColorDark extends Color implements WidgetStateColor {
  const ChipLabelColorDark() : super(_default);

  static const int _default = 0xFF000000;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return OAppColors.secondaryColorDark; // Selected text color
    }
    return OAppColors.primaryColorDark; // normal text color
  }
}

class ChipSideDark extends BorderSide implements WidgetStateProperty {
  const ChipSideDark() : super();

  @override
  BorderSide resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return BorderSide(color: OAppColors.secondaryColorDark, width: 1);
    }
    return BorderSide(color: OAppColors.primaryColor, width: 1);
  }
}

class ChipShapeDark extends BorderSide implements WidgetStateProperty {
  const ChipShapeDark() : super();

  @override
  OutlinedBorder resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: OAppColors.secondaryColorDark, width: 1),
      );
    }
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(color: OAppColors.secondaryColorDark, width: 1),
    );
  }
}
