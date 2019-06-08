import 'package:flutter/material.dart';

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Montserrat',
      accentColor: Colors.white);
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      accentColor: Color.fromRGBO(91, 199, 248, 1),
      fontFamily: 'Montserrat');
}
