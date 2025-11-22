import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchRouteName);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: categoryProvider.isLoading == false
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey[200],
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          categoryProvider.getNewsData();
                        },
                        child: Card(
                          color: Colors.blueAccent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 11.0, vertical: 8.0),
                            child: Text(
                              categoryProvider.newsList[index].source.id
                                  .toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      itemCount: categoryProvider.newsList.length,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: categoryProvider.newsList.length,
                    itemBuilder: (context, index) {
                      final article = categoryProvider.newsList[index];
                      return ItemCard(article: article);
                    },
                  ),
                ),
              ],
            ),
      // final tabList = [
      //   Tab(text: AppLocalizations.of(context)!.abc_news),
      //   Tab(text: AppLocalizations.of(context)!.aftonposten),
      //   Tab(text: AppLocalizations.of(context)!.ansa_it),
      //   Tab(text: AppLocalizations.of(context)!.ary_news),
      //   Tab(text: AppLocalizations.of(context)!.axios),
      // ];
      // return DefaultTabController(
      //   length: tabList.length, // number of tabs
      //   child: Scaffold(
      //     appBar: AppBar(
      //       title: Text(catigory),
      //       actions: [
      //         IconButton(onPressed: () {
      //           Navigator.pushNamed(context, AppRoutes.searchRouteName);
      //         }, icon: const Icon(Icons.search)),
      //       ],
      //       bottom: TabBar(tabs: tabList),
      //     ),
      //     drawer: const CustomDrawer(),

      // body: TabBarView(
      //   children: [
      //     AbcNewsTab(),
      //     Center(child: Text('News Screen')),
      //     Center(child: Text('Profile Screen')),
      //     Center(child: Text('Profile Screen')),
      //     Center(child: Text('Profile Screen')),
      //   ],
      // ),
    );
  }
}
