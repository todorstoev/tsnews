import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:tsnews/models/news.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<int> _topNews = [
    20106750,
    20131724,
    20114219,
    20127470,
    20127468,
    20123031,
    20132720,
    20112595,
    20117662,
    20122689,
    20107857,
    20126797,
    20126676,
    20126405,
    20126367,
    20128749,
    20107534,
    20119974,
    20114987,
    20130493,
    20113174,
    20116217,
    20114282,
    20120835,
    20118231,
    20128040,
    20128566,
    20115086,
    20117409,
    20129276,
    20121197,
    20116039,
    20125997,
    20119735,
    20121199,
    20120618,
    20115088,
    20114968,
    20110530,
    20106950,
    20129948,
    20126665,
    20121533,
    20121976,
    20126437,
    20118256,
    20109508,
    20109232,
    20129763,
    20125965,
    20129704,
    20118305,
    20106670,
    20118037,
    20110224,
    20115255,
    20119916,
    20114066,
    20109918,
    20117078,
    20126790,
    20128864,
    20128390,
    20129086,
    20126656
  ];

  Future<News> _getNews(int id) async {
    try {
      final String url = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
      final res = await http.get(url);

      final Map newsMap = jsonDecode(res.body);
      final News news = News.fromJson(newsMap);

      return news;
    } catch (e) {
      throw new Error();
    }
  }

  Widget _buildItem(News news) {
    var user = Provider.of<FirebaseUser>(context);
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
    return ListView(
      children: _topNews
          .map((i) => FutureBuilder<News>(
              future: _getNews(i),
              builder: (BuildContext context, AsyncSnapshot<News> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return _buildItem(snapshot.data);
                } else {
                  return Text('...');
                }
              }))
          .toList(),
    );
  }
}
