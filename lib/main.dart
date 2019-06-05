import 'package:flutter/material.dart';
import 'package:tsnews/models/themes.dart' as Themes;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = "TSNEWS";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: Themes.MyThemes.lightTheme,
        darkTheme: Themes.MyThemes.darkTheme,
        home: PageBuilder(
          page: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello From Home');
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
