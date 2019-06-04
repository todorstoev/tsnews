import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return isIOS
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(
              primaryColor: Color(0xFFFF2D55),
            ),
            home: AdaptiveMainScreen(),
          )
        : MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Veggie Tracker',
            home: AdaptiveMainScreen(),
          );
  }
}

class AdaptiveMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              title: Text('Log'),
              icon: Icon(CupertinoIcons.book),
            ),
            BottomNavigationBarItem(
              title: Text('List'),
              icon: Icon(CupertinoIcons.create),
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        tabBuilder: (context, index) {
          return (index == 0)
              ? CupertinoTabView(builder: (context) => LogScreen())
              : CupertinoTabView(
                  builder: (context) => ListScreen(),
                  defaultTitle: ListScreen.title);
        },
      );
    } else {
      return CupertinoPageScaffold();
    }
  }
}
