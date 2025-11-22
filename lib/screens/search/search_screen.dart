import 'package:flutter/material.dart';
import 'package:news_app/controller/articale_provider.dart';
import 'package:news_app/model/article_model.dart';
import 'package:provider/provider.dart';

import '../general/widgets/custom_general_list_view_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final articleProvider = Provider.of<ArticleProvider>(context);
    final List<Article> news = articleProvider.newsList;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  articleProvider.searchNews(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // articleProvider.clearSearch();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                ),
              ),
            ),
            SizedBox(
                height: size.height * 0.8,
                child: CustomGeneralListViewBody(news: news, size: size)),
          ],
        ),
      ),
    );
  }
}
