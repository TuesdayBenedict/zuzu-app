import 'package:flutter/material.dart';
import 'package:zuzu/components/pallete.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: primary500,
      background: white,
      onBackground: greyscale900,
      brightness: Brightness.light,
      secondary: white,
      onPrimary: white,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.redAccent,
      surface: greyscale050,
      onSurface: white,
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: primary500,
      background: dark1,
      onBackground: white,
      brightness: Brightness.dark,
      secondary: white,
      onPrimary: white,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.redAccent,
      surface: dark2,
      onSurface: white,
    ),
  );
}
