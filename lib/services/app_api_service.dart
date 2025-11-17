import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/repositories/app_repository.dart';
import 'package:news_app/utils/app_constants.dart';

class AppApiService implements AppRepository {
  late Dio dio;

  // Private constructor
  AppApiService._() {
    dio = Dio();
  }

  static final AppApiService _instance = AppApiService._();

  // Factory constructor returns the same instance
  factory AppApiService() => _instance;

  @override
  Future<List<Map<String, dynamic>>> getNewsData() async {
    List<Map<String, dynamic>> articles = [];

    try {
      Response response = await dio
          .get('https://newsapi.org/v2/everything?q=Apple&apiKey=$apiKey');
      log(response.data['articles'][1]['author'].toString());
      if (response.statusCode == 200) {
        articles = List<Map<String, dynamic>>.from(response.data['articles']);
        return articles;
      }
    } catch (e) {
      log(e.toString());
    }
    return articles;
  }

  @override
  Future<List<Map<String, dynamic>>> getCategoryData(String category) async {
    List<Map<String, dynamic>> articles = [];
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey');

      log(response.data.toString());

      if (response.statusCode == 200) {
        articles = List<Map<String, dynamic>>.from(response.data['articles']);
        return articles;
      }
    } catch (e) {
      log(e.toString());
    }
    return articles;
  }

  @override
  Future<List<Map<String, dynamic>>> searchNewsData(String query) async {
    List<Map<String, dynamic>> articles = [];
    try {
      Response response = await dio
          .get('https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey');
      log(response.data.toString());
      if (response.statusCode == 200) {
        articles = List<Map<String, dynamic>>.from(response.data['articles']);
        return articles;
      }
    } catch (e) {
      log(e.toString());
    }
    return articles;
  }
}
