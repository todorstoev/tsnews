import 'package:flutter/material.dart';

class MyThemes {
  bool _isLight = false;
  bool get isLight => _isLight;
  set doSomethingCool(bool light) {
    _isLight = light;
  }

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Plaster',
      primaryColor: Color(0xFF2196f3),
      primaryColorDark: Color(0xFF0069c0),
      primaryColorLight: Color(0xFF6ec6ff),
      accentColor: Colors.white,
      iconTheme: IconThemeData(
          color: Color(0xFF6ec6ff)
      )
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFF9c27b0),
      primaryColorDark: Color(0xFF6a0080),
      primaryColorLight: Color(0xFFd05ce3),
      accentColor: Colors.white,
      iconTheme: IconThemeData(
          color: Color(0xFFd05ce3)
      ),
      fontFamily: 'Montserrat');
}
