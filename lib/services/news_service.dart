import 'package:dio/dio.dart';
import 'package:news_app2/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    //return Future.delayed(Duration(seconds: 10));
    try {
      var response = await dio.get(
          'https://gnews.io/api/v4/search?q=example&lang=en&country=us&max=10&apikey=921a12886131199a922b8a5fda72a862');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
