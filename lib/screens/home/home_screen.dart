import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/images_model.dart';
import 'package:news_app/common_widgets/view_all_overlay.dart';

import '../../utils/app_routes.dart';
import '../../common_widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<ImagesModel> newsLightImages = ImagesModel.lightImages;
  final List<ImagesModel> newsDarkImages = ImagesModel.darkImages;

  @override
  Widget build(BuildContext context) {
    // Detect current theme mode (dark or light)
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Choose the correct list of images
    final List<ImagesModel> news = isDarkMode
        ? newsLightImages
        : newsDarkImages;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.home,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchRouteName);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),

              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(news[index].image),
                  ),

                  ViewAllOverlay(
                    isLeft: news[index].postions == 'left',
                    label: AppLocalizations.of(context)!.view_all,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
