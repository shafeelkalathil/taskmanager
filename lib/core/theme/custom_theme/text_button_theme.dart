import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';
import '../../utils/styles/text_style.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: mainBold14, foregroundColor: neutral.shade900));
}
