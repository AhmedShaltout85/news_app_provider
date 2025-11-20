

import 'package:news_app/model/article_model.dart';

abstract class AppApiService {

  Future<List<Article>> getNewsData();
  Future<List<Article>> getCategoryData(String category);
  Future<List<Article>> searchNewsData(String query);
  // Future<List<Map<String, dynamic>>> getNewsData();
  // Future<List<Map<String, dynamic>>> getCategoryData(String category);
  // Future<List<Map<String, dynamic>>> searchNewsData(String query);
}