import 'package:dio/dio.dart';
import 'models/news_model.dart';
class ApiServices {
  final Dio dio;
  ApiServices(this.dio);
  Future<List<NewsModel>> getNewsData({required String category}) async {
    try{
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=&apiKey=5308226e425145d18469c4d55f8dd952&category=$category",
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> newsList = jsonData["articles"];
      List<NewsModel> newsModel = [];
      for (var article in newsList) {
        NewsModel news = NewsModel(
          image: article["urlToImage"],
          title: article["title"],
          subtitle: article["description"],
        );
        newsModel.add(news);
      }
      return newsModel;
    }catch(e){return [];}
  }
}