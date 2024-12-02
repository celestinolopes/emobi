import 'package:flutter/material.dart';

class PalleteColors {
  static const Color green = Color(0xFF4ED52F);
  static const _primary = {
    50: Color.fromRGBO(15, 45, 73, 0.1),
    100: Color.fromRGBO(15, 45, 73, 0.2),
    200: Color.fromRGBO(15, 45, 73, 0.3),
    300: Color.fromRGBO(15, 45, 73, 0.4),
    400: Color.fromRGBO(15, 45, 73, 0.5),
    500: Color.fromRGBO(15, 45, 73, 0.6),
    600: Color.fromRGBO(15, 45, 73, 0.7),
    700: Color.fromRGBO(15, 45, 73, 0.8),
    800: Color.fromRGBO(15, 45, 73, 0.9),
    900: Color.fromRGBO(15, 45, 73, 1.0),
  };

  static const _accentColor = {
    50: Color.fromRGBO(255, 108, 0, 0.1),
    100: Color.fromRGBO(255, 108, 0, 0.2),
    200: Color.fromRGBO(255, 108, 0, 0.3),
    300: Color.fromRGBO(255, 108, 0, 0.4),
    400: Color.fromRGBO(255, 108, 0, 0.5),
    500: Color.fromRGBO(255, 108, 0, 0.6),
    600: Color.fromRGBO(255, 108, 0, 0.7),
    700: Color.fromRGBO(255, 108, 0, 0.8),
    800: Color.fromRGBO(255, 108, 0, 0.9),
    900: Color.fromRGBO(255, 108, 0, 1.0),
  };

  static const _white = {
    50: Color.fromRGBO(238, 245, 252, 0.1),
    100: Color.fromRGBO(238, 245, 252, 0.2),
    200: Color.fromRGBO(238, 245, 252, 0.3),
    300: Color.fromRGBO(238, 245, 252, 0.4),
    400: Color.fromRGBO(238, 245, 252, 0.5),
    500: Color.fromRGBO(238, 245, 252, 0.6),
    600: Color.fromRGBO(238, 245, 252, 0.7),
    700: Color.fromRGBO(238, 245, 252, 0.8),
    800: Color.fromRGBO(238, 245, 252, 0.9),
    900: Color.fromRGBO(238, 245, 252, 1.0),
  };

  static const MaterialColor primaryColor = MaterialColor(0XFF052849, _primary);

  static const MaterialColor accentColor =
      MaterialColor(0xFFFF6C00, _accentColor);

  static const white = Colors.white;
}
