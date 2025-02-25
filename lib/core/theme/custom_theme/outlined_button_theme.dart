import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';
import '../../utils/styles/text_style.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primary,
      textStyle: mainBold12,
      side: BorderSide(color: primary),
    ),
  );
}
