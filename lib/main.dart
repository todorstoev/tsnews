import 'package:flutter/material.dart';
import 'package:tsnews/models/themes.dart' as Themes;

import 'package:tsnews/screens/login.dart';
import 'package:tsnews/screens/home.dart';

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
      debugShowCheckedModeBanner: false,
      theme: isLight ? Themes.MyThemes.lightTheme : Themes.MyThemes.darkTheme,
      darkTheme: Themes.MyThemes.darkTheme,
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/news': (context) => PageBuilder(
              changeTheme: changeTheme,
              page: Home(),
              title: "",
            ),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/': (context) => PageBuilder(
              changeTheme: changeTheme,
              page: LoginPage(),
              title: "",
            ),
      },
    );
  }
}

class PageBuilder extends StatefulWidget {
  final Widget page;
  final VoidCallback changeTheme;
  final String title;

  PageBuilder({Key key, this.page, this.changeTheme, this.title})
      : super(key: key);

  @override
  _PageBuilderState createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: widget.page,
      floatingActionButton: FloatingActionButton(
        onPressed: widget.changeTheme,
        child: Icon(Icons.change_history),
      ),
    );
  }
}
