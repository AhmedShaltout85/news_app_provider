import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/network_repos/remote_repos/app_api_service.dart';
import 'package:news_app/utils/app_constants.dart';

class AppApiServiceImpl implements AppApiService {

  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      receiveDataWhenStatusError: true,
    ));
  }

  @override
  Future<List<Article>> getNewsData() async {

    try {
      Response response = await dio
          .get('everything?q=apple&sortBy=popularity&apiKey=$apiKey');
      // log(response.data.toString());
      if (response.statusCode == 200) {
        // articles = List<Map<String, dynamic>>.from(response.data['articles']);
        // return articles;
        var jsonData = response.data;
        // log("=====> JSON-DATA$jsonData");
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articleList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
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
    try {
      Response response = await dio.get(
          'top-headlines?country=us&category=$category&apiKey=$apiKey');
     

      log(response.data.toString());

      if (response.statusCode == 200) {
        // articles = List<Map<String, dynamic>>.from(response.data['articles']);
        // return articles;
        var jsonData = response.data;
        // log("=====> JSON-DATA$jsonData");
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articleList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
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
          .get('everything?q=$query&apiKey=$apiKey');
      log(response.data.toString());
      if (response.statusCode == 200) {
        var jsonData = response.data;
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articleList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        log("ARTICLE LIST${articleList.first.title}");
        return articleList;
      }
    } catch (e) {
      log(e.toString());
    }
    return articles;
  }
  //fetch data with dio package no model parsing
  @override
  Future<Response> fetchData(String endpoint, Map<String, dynamic> params) async {
    return await dio.get(endpoint, queryParameters: params);
  }
}
