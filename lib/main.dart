import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tsnews/models/themes.dart' as Themes;

// import 'package:tsnews/screens/login.dart';
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
        home: PageBuilder(
          page: Home(),
          changeTheme: changeTheme,
          title: title,
        ));
  }
}

class PageBuilder extends StatelessWidget {
  final Widget page;
  final VoidCallback changeTheme;
  final String title;

  PageBuilder({Key key, this.page, this.changeTheme, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.loop),
            onPressed: changeTheme,
          )
        ],
      ),
    );
  }
}
