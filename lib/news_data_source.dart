
import 'base_news.dart';


class NewsDataSource {
  static NewsDataSource instance =NewsDataSource();

  Future<Map<String, dynamic>> loadNews() {
    return BaseNews.get("News");
  }

  Future<Map<String, dynamic>> loadDetailNews(int idDiterima){
    String id = idDiterima.toString();
    return BaseNews.get("News/$id");
  }
}