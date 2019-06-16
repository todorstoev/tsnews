import 'package:rxdart/rxdart.dart';
import 'package:tsnews/resources/news_provider.dart';
import 'package:tsnews/models/news.dart';
import 'dart:collection';

class NewsBloc {
  final NewsProvider newsProvider = NewsProvider();

  final _newsFetcher = BehaviorSubject<UnmodifiableListView<News>>();

  NewsBloc() {
    _fetchAllNews();
  }

  Observable<UnmodifiableListView<News>> get allNews => _newsFetcher.stream;

  _fetchAllNews() async {
    List<News> news = await newsProvider.fetchAllNews();
    _newsFetcher.sink.add(UnmodifiableListView(news));
  }

  dispose() {
    _newsFetcher.close();
  }
}
