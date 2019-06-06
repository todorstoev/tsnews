import 'package:flutter/material.dart';
import 'package:tsnews/models/themes.dart' as Themes;

import 'package:tsnews/screens/login.dart';

void main() => runApp(MyApp());
typedef void VoidCallback();

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final title = "TSNEWS";
  bool isLight = true;

  void changeTheme() {
    setState(() {
      isLight = !this.isLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: isLight ? Themes.MyThemes.lightTheme : Themes.MyThemes.darkTheme,
        darkTheme: Themes.MyThemes.darkTheme,
        home: PageBuilder(
          page: Home(this.changeTheme),
        ));
  }
}

class Home extends StatelessWidget {
  final VoidCallback changeTheme;

  Home(this.changeTheme);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text('Change Theme'),
      onPressed: () {
        this.changeTheme();
      },
    );
  }
}

class PageBuilder extends StatelessWidget {
  final Widget page;

  PageBuilder({Key key, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
      appBar: AppBar(
        centerTitle: true,
        title: Text('test'),
      ),
    );
  }
}
