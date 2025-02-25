import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';
import '../../utils/styles/text_style.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: primary.shade500,
      disabledForegroundColor: Colors.white,
      disabledBackgroundColor: Colors.black.withOpacity(0.2),
      padding: const EdgeInsets.all(16),
      textStyle: mainBold16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
}