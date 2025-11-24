

import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';

abstract class AppApiService {

  Future<List<Article>> getNewsData();
  Future<List<Article>> getCategoryData(String category);
  Future<List<Article>> searchNewsData(String query);
  //fetch data with dio package no model parsing
  Future<Response> fetchData(String endpoint, Map<String, dynamic> params);
}