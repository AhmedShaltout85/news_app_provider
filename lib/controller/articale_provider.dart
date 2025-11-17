import 'dart:developer';

import 'package:flutter/material.dart';

import '../repositories/app_repository.dart';

class ArticleProvider with ChangeNotifier {
  final AppRepository appRepository;
  List<Map<String, dynamic>> newsList = [];
  List<Map<String, dynamic>> categoryNewsList = [];
  bool isLoading = false;

  ArticleProvider({required this.appRepository});

  Future<void> getNewsData() async {
    newsList = await appRepository.getNewsData();
    isLoading = true;
    notifyListeners();
  }

  Future<void> getCategoryNewsData(String category) async {
    categoryNewsList = await appRepository.getCategoryData(category);
    isLoading = true;
    notifyListeners();
  }

  Future<void> searchNews(String query) async {
    if (query.isEmpty || query == ' ') {
      await getNewsData();
      return;
    }

    try {
      getNewsData().then((_) {
        newsList = newsList
            .where((article) => article['title']
                .toLowerCase()
                .contains(query.trim().toLowerCase()))
            .toList();
      });
    } catch (e) {
      log(e.toString());
      await getNewsData();
    } finally {
      isLoading = true;
      notifyListeners();
    }
  }
}
