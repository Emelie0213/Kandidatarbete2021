import 'package:flutter/material.dart';

class Theme {
  static const onPrimaryColor = Color(0xFFF9A825);
  static const backgroundColor = Color(0xFF1B5E20);

  static final ThemeData materialTheme = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: onPrimaryColor),
    backgroundColor: backgroundColor,
  );
}
