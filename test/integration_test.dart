import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import "package:tsnews/models/news.dart";
// import 'package:tsnews/main.dart';
import 'package:http/http.dart' as http;

main() {
  test("Successfully retrieving news", () async {
    final String url =
        "https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty";
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final Map newsMap = jsonDecode(res.body);
      final News news = News.fromJson(newsMap);

      expect(news.by, "dhouston");
    }
  });
}
