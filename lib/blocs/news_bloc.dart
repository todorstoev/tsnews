import 'package:rxdart/rxdart.dart';
import 'package:tsnews/resources/news_provider.dart';
import 'package:tsnews/models/news.dart';

class NewsBloc {
  final NewsProvider newsProvider = NewsProvider();

  final _newsFetcher = BehaviorSubject<List<News>>();

  NewsBloc() {
    this.fetchAllNews();
  }

  Observable<List<News>> get allNews => _newsFetcher.stream;

  fetchAllNews() async {
    List<News> news = await newsProvider.fetchAllNews();
    _newsFetcher.sink.add(news);
  }

  dispose() {
    _newsFetcher.close();
  }
}
