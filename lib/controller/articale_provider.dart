import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';

import '../network_repos/remote_repos/app_api_service.dart';
import '../network_repos/remote_repos/app_api_service_impl.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> newsList = [];
  List<Article> categoryNewsList = [];
  bool isLoading = false;

  final AppApiService appApiService = AppApiServiceImpl();
  Future<void> getNewsData() async {
    newsList = await appApiService.getNewsData();
    log("NEWS LIST LENGTH ${newsList.length}");
    isLoading = true;
    notifyListeners();
  }

  Future<void> getCategoryNewsData(String category) async {
    newsList = await appApiService.getCategoryData(category);
    isLoading = true;
    notifyListeners();
  }

  void searchNews(String query) {
    if (query.isEmpty || query == ' ') {
      getNewsData();
    } else {
      newsList = newsList
          .where((article) => article.title
              .toLowerCase()
              .contains(query.trim().toLowerCase()))
          .toList();
      notifyListeners();
    }
  }
}
