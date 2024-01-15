import 'package:flutter/material.dart';

// For responsive design

class SizeConfig {
  static MediaQueryData? _mediaQuerydata;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQuerydata = MediaQuery.of(context);
    screenWidth = _mediaQuerydata!.size.width;
    screenHeight = _mediaQuerydata!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}
