import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';

import '../network_repos/remote_repos/app_api_service.dart';
import '../network_repos/remote_repos/app_api_service_impl.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> newsList = [];
  List<Article> newsGeneralList = [];
  List<Article> newsBusinessList = [];
  List<Article> newsEntertainmentList = [];
  List<Article> newsHealthList = [];
  List<Article> newsScienceList = [];
  List<Article> newsSportsList = [];
  List<Article> newsTechnologyList = [];
  List<Article> newsSelectedCategoryList = [];

  bool isLoading = false;

  final AppApiService appApiService = AppApiServiceImpl();
  Future<void> getNewsData() async {
    newsList = await appApiService.getNewsData();
    log("NEWS LIST LENGTH ${newsList.length}");
    isLoading = true;
    notifyListeners();
  }

  Future<void> getCategoryNewsData(String category) async {
    loadSelectedCategoryNewsList(category);
    newsSelectedCategoryList = await appApiService.getCategoryData(category);
    log("NEWS SELECTED CATEGORY LIST LENGTH ${newsSelectedCategoryList.length}");
    log(  "CATEGORY ===> $category");
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
  void loadSelectedCategoryNewsList(String category) {
    switch (category.toLowerCase()) {
      case 'general':
        newsSelectedCategoryList = newsGeneralList;
        break;
      case 'business':
        newsSelectedCategoryList = newsBusinessList;
        break;
      case 'entertainment':
        newsSelectedCategoryList = newsEntertainmentList;
        break;
      case 'health':
        newsSelectedCategoryList = newsHealthList;
        break;
      case 'science':
        newsSelectedCategoryList = newsScienceList;
        break;
      case 'sports':
        newsSelectedCategoryList = newsSportsList;
        break;
      case 'technology':
        newsSelectedCategoryList = newsTechnologyList;
        break;
      default:
        newsSelectedCategoryList = [];
    }
    notifyListeners();
  }
}
