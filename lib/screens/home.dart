import "package:flutter/material.dart";
import "package:tsnews/models/news.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:tsnews/resources/news_provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _buildItem(News news) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(news.title),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(news.type),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  if (await canLaunch(news.url)) {
                    await launch(news.url);
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return FutureBuilder(future: NewsProvider. ,)
  }
}
