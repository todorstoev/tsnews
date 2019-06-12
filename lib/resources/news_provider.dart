import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:tsnews/models/news.dart';

class NewsProvider {
  Client client = Client();

  final List<int> _topNews = [
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
      final res = await client.get(url);

      final Map newsMap = jsonDecode(res.body);
      final News news = News.fromJson(newsMap);

      return news;
    } catch (e) {
      throw new Error();
    }
  }

  Future<List<News>> fetchAllNews() async {
    final news = _topNews.map((id) => _getNews(id));
    final articles = await Future.wait(news);

    return articles;
  }



  


}
