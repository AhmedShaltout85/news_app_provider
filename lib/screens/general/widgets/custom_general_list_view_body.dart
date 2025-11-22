import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/utils/app_routes.dart';

class CustomGeneralListViewBody extends StatelessWidget {
  const CustomGeneralListViewBody({
    super.key,
    required this.size,
    required this.news,
  });

  final Size size;
  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(news[index].urlToImage ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text(
                      news[index].title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors
                            .transparent, // allows margin + rounded corners
                        isScrollControlled: true,
                        builder: (context) {
                          return Container(
                            margin: const EdgeInsets.all(
                              16,
                            ), // space around the sheet
                            height: size.height * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.3,
                                  padding: const EdgeInsets.all(18.0),
                                  margin: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          news[index].urlToImage ?? ''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    news[index].description ??
                                        'No description available',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);

                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.detailRouteName,
                                      arguments: news[index],
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: size.width * 0.8,
                                    padding: const EdgeInsets.all(8.0),
                                    margin: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Text(
                                      AppLocalizations.of(
                                        context,
                                      )!
                                          .view_full_article,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Text(
                      news[index].author ?? 'Unknown Author',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(child: Container()),
                    Text(
                      news[index].publishedAt.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      itemCount: news.length,
    );
  }
}
