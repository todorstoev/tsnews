import 'package:flutter/material.dart';
import 'package:tsnews/models/themes.dart' as Themes;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tsnews/screens/login.dart';
import 'package:tsnews/screens/home.dart';

void main() => runApp(MyApp());

typedef void VoidCallback();

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final title = "Branding and themes";
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 90.0,
              child: DrawerHeader(

                child: Text('COMPANY LOGO', style: TextStyle(fontFamily: 'Plaster'),),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),

//              decoration: BoxDecoration(
//                gradient: LinearGradient(
//                  begin: Alignment.centerLeft,
//                  end: Alignment.centerRight,
//                  // Add one stop for each color. Stops should increase from 0 to 1
//                  stops: [0.1, 0.8],
//                  colors: [
//                    // Colors are easy thanks to Flutter's Colors class.
//                    Color.fromRGBO(101, 121, 155, 1),
//                    Color.fromRGBO(94, 37, 99, 1)
//                  ],
//                ),
//              ),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.calculator,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Calculator',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.building,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Offices',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.searchLocation,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Contacts',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.signOutAlt,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Exit',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0),
              child: Text('External links'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.home,
                  color: Theme.of(context).primaryColorDark,
                ),
                Icon(
                  FontAwesomeIcons.envelope,
                  color: Theme.of(context).primaryColorDark,
                ),
                Icon(
                  FontAwesomeIcons.facebook,
                  color: Theme.of(context).primaryColorDark,
                ),
                Icon(
                  FontAwesomeIcons.twitter,
                  color: Theme.of(context).primaryColorDark,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Divider(),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Text('Theming'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: widget.changeTheme,
                  child: Icon(Icons.color_lens),
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF0085c1),
                  mini: true
                ),
                FloatingActionButton(
                  onPressed: widget.changeTheme,
                  child: Icon(Icons.color_lens),
                  backgroundColor: Colors.black87,
                  foregroundColor: Color(0xFF9c27b0),
                  mini: true,
                  tooltip: 'Dark theme',

                ),

              ],
            ),
//            Container(
//              margin: EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0),
//              child: Text('Main colors'),
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                FloatingActionButton(
//                    onPressed: widget.changeTheme,
//                    child: Icon(Icons.colorize),
//                    backgroundColor: Color(0xFF28b5f4),
//                    foregroundColor: Color(0xFF0085c1),
//                    mini: true
//                ),
//                FloatingActionButton(
//                  onPressed: widget.changeTheme,
//                  child: Icon(Icons.colorize),
//                  backgroundColor: Color(0xFF9c27b0),
//                  foregroundColor: Color(0xFF6a0080),
//                  mini: true,
//                ),
//                FloatingActionButton(
//                  onPressed: widget.changeTheme,
//                  child: Icon(Icons.colorize),
//                  backgroundColor: Color(0xFFe53935),
//                  foregroundColor: Color(0xFFab000d),
//                  mini: true,
//                ),
//                FloatingActionButton(
//                  onPressed: widget.changeTheme,
//                  child: Icon(Icons.colorize),
//                  backgroundColor: Color(0xFF009688),
//                  foregroundColor: Color(0xFF00675b),
//                  mini: true,
//                ),
//
//              ],
//            )
          ],
        ),
      ),
      appBar: AppBar(),
      body: widget.page,
    );
  }
}
