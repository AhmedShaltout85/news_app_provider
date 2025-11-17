import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_routes.dart';

import '../../../../model/images_model.dart';

class CustomGeneralListViewBody extends StatelessWidget {
  const CustomGeneralListViewBody({
    super.key,
    required this.size,
    required this.news,
  });

  final Size size;
  final List<ImagesModel> news;

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
              children: [
                Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(news[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Text(
                      'some text some text some text some text some text some text',
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
                                      image: AssetImage(news[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'some text some text some text some text some text some text',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.detailRouteName,
                                      arguments: {
                                        "appBarTitle":
                                            "ABC News",
                                        "image": news[index].image,
                                        "content":
                                            "some text some text some text some text some text some text",
                                        "senderName": "Joy Haworth",
                                        "time": "October8, 2024 9:38 AM"
                                      },
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
                                      )!.view_full_article,
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
                      'By Joy Haworth',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(child: Container()),
                    Text(
                      '15 minutes ago',
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
