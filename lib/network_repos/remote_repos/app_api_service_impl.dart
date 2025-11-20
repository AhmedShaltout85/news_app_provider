import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/network_repos/remote_repos/app_api_service.dart';
import 'package:news_app/utils/app_constants.dart';

class AppApiServiceImpl implements AppApiService {
  late Dio dio;

  // Private constructor
  AppApiServiceImpl._() {
    dio = Dio();
  }

  static final AppApiServiceImpl _instance = AppApiServiceImpl._();

  // Factory constructor returns the same instance
  factory AppApiServiceImpl() => _instance;

  @override
  Future<List<Article>> getNewsData() async {
    // List<Map<String, dynamic>> articles = [];

    try {
      Response response = await dio
          .get('https://newsapi.org/v2/everything?q=Apple&apiKey=$apiKey');
      // log(response.data.toString());
      if (response.statusCode == 200) {
        // articles = List<Map<String, dynamic>>.from(response.data['articles']);
        // return articles;
        var jsonData = response.data;
        // log("=====> JSON-DATA$jsonData");
        Articles articles =
            Articles.fromJson(jsonData);
        List<Article> articleList = articles.articles
            .map((e) => Article.fromJson(e))
            .toList();
        log("ARTICLE LIST${articleList.first.title}");
        return articleList;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  @override
  Future<List<Article>> getCategoryData(String category) async {
    // List<Map<String, dynamic>> articles = [];
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey');

      log(response.data.toString());

      if (response.statusCode == 200) {
        // articles = List<Map<String, dynamic>>.from(response.data['articles']);
        // return articles;
        var jsonData = response.data;
        // log("=====> JSON-DATA$jsonData");
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articleList = articles.articles
            .map((e) => Article.fromJson(e)).toList();
        log("ARTICLE LIST${articleList.first.title}");
        return articleList;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  @override
  Future<List<Article>> searchNewsData(String query) async {
    List<Article> articles = [];
    try {
      Response response = await dio
          .get('https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey');
      log(response.data.toString());
      if (response.statusCode == 200) {
        var jsonData = response.data;
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articleList = articles.articles
            .map((e) => Article.fromJson(e)).toList();
        log("ARTICLE LIST${articleList.first.title}");
        return articleList;
      }
    } catch (e) {
      log(e.toString());
    }
    return articles;
  }
}
