import 'package:flutter/material.dart';
import 'package:oso/commons/constants/colors.dart';


class OBottomSheet {
  OBottomSheet._();

  static final BottomSheetThemeData lightBottomSheetTheme =
  BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: OAppColors.primaryColor,
    modalBackgroundColor: OAppColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
  );

  static final BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: OAppColors.primaryColorDark,
    modalBackgroundColor: OAppColors.primaryColorDark,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}