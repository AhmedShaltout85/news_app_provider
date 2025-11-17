import 'package:flutter/material.dart';

import '../../model/images_model.dart';
import '../general/tabs/widgets/custom_general_list_view_body.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
final List<ImagesModel> newsLightImages = ImagesModel.lightImages;
  final List<ImagesModel> newsDarkImages = ImagesModel.darkImages;
  @override
  Widget build(BuildContext context) {
     final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var size = MediaQuery.of(context).size;
    final List<ImagesModel> news = isDarkMode
        ? newsLightImages
        : newsDarkImages;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: TextEditingController(),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon:  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                ),
              ),
            ),
            SizedBox(height: size.height * 0.8,
              child: CustomGeneralListViewBody(news: news, size: size)),

          ],
        ),
      ),
    );
  }
}
