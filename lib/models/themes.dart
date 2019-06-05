import 'package:flutter/material.dart';

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Colors.blue,
      brightness: Brightness.light,
      accentColor: Colors.white,
      fontFamily: 'Montserrat');
  static final ThemeData darkTheme = ThemeData(
      primaryColor: Colors.grey,
      brightness: Brightness.dark,
      fontFamily: 'Montserrat');
}
