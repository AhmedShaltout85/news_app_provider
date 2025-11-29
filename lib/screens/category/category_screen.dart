

import 'package:flutter/material.dart';
import 'package:news_app/common_widgets/commoncomponents.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/custom_drawer.dart';
import '../../controller/articale_provider.dart';
import 'widgets/item_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String category =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'General';
    var categoryProvider = context.watch<ArticleProvider>();

    // Get unique sources
    final sources = categoryProvider.newsSelectedCategoryList
        .map((article) => article.source.name)
        .toSet()
        .toList();

    final tabs = ['All', ...sources];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(category),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  // Navigator.pushNamed(context, AppRoutes.searchRouteName),
                  nanvigateTo(context, AppRoutes.searchRouteName),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: categoryProvider.isLoading == false
            ? const Center(child: CircularProgressIndicator())
            : TabBarView(
                children: tabs.map((tab) {
                  final articles = tab == 'All'
                      ? categoryProvider.newsSelectedCategoryList
                      : categoryProvider.newsSelectedCategoryList
                          .where((article) => article.source.name == tab)
                          .toList();

                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) =>
                        ItemCard(article: articles[index]),
                  );
                }).toList(),
              ),
      ),
    );
  }
}
