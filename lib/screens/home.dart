import "package:flutter/material.dart";
import "package:tsnews/models/news.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:tsnews/blocs/news_bloc.dart';
import 'dart:collection';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NewsBloc bloc = NewsBloc();

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
    return StreamBuilder<UnmodifiableListView<News>>(
      stream: bloc.allNews,
      initialData: UnmodifiableListView<News>([]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: <Widget>[for (var el in snapshot.data) _buildItem(el)],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
