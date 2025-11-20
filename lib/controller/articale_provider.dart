import 'package:flutter/material.dart';

import '../repositories/app_api_service.dart';
import '../repositories/services/app_api_service_impl.dart';

class ArticleProvider with ChangeNotifier {
  List<Map<String, dynamic>> newsList = [];
  List<Map<String, dynamic>> categoryNewsList = [];
  bool isLoading = false;

  final AppApiService appApiService = AppApiServiceImpl();
  Future<void> getNewsData() async {
    newsList = await appApiService.getNewsData();
    isLoading = true;
    notifyListeners();
  }

  Future<void> getCategoryNewsData(String category) async {
    categoryNewsList = await appApiService.getCategoryData(category);
    isLoading = true;
    notifyListeners();
  }

  void searchNews(String query) {
    if (query.isEmpty || query == ' ') {
      getNewsData();
    } else {
      newsList = newsList
          .where((article) => article['title']
              .toLowerCase()
              .contains(query.trim().toLowerCase()))
          .toList();
      notifyListeners();
    }
  }
}
