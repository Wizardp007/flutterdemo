import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstant {
  //
  // static const Color colorPrimary = MaterialColor.fromARGB(255,13, 37, 63);
  // static const Color colorSecondPrimary = Color.fromARGB(255,1, 180, 228);
  // static const Color colorTertiary = Color.fromARGB(255,144, 206, 161);

  static const int darkBlue = 0XFF0d253f;
  static const int lightBlue = 0XFF01b4e4;
  static const int lightGreen = 0XFF90cea1;
  static const MaterialColor colorPrimary = MaterialColor(darkBlue,  <int, Color>{
    50: Color(darkBlue),
    100: Color(darkBlue),
    200: Color(darkBlue),
    300: Color(darkBlue),
    400: Color(darkBlue),
    500: Color(darkBlue),
    600: Color(darkBlue),
    700: Color(darkBlue),
    800: Color(darkBlue),
    900: Color(darkBlue),
  });
  static const MaterialColor colorSecondPrimary = MaterialColor(lightBlue,  <int, Color>{
    50: Color(lightBlue),
    100: Color(lightBlue),
    200: Color(lightBlue),
    300: Color(lightBlue),
    400: Color(lightBlue),
    500: Color(lightBlue),
    600: Color(lightBlue),
    700: Color(lightBlue),
    800: Color(lightBlue),
    900: Color(lightBlue),
  });
  static const MaterialColor colorTertiary = MaterialColor(lightGreen,  <int, Color>{
    50: Color(lightGreen),
    100: Color(lightGreen),
    200: Color(lightGreen),
    300: Color(lightGreen),
    400: Color(lightGreen),
    500: Color(lightGreen),
    600: Color(lightGreen),
    700: Color(lightGreen),
    800: Color(lightGreen),
    900: Color(lightGreen),
  });
}