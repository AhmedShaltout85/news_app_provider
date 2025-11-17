import 'package:flutter/material.dart';

import '../../../model/images_model.dart';
import 'widgets/custom_general_list_view_body.dart';

class AbcNewsTab extends StatelessWidget {
  AbcNewsTab({super.key});
  final List<ImagesModel> newsLightImages = ImagesModel.lightImages;
  final List<ImagesModel> newsDarkImages = ImagesModel.darkImages;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var size = MediaQuery.of(context).size;
    final List<ImagesModel> news = isDarkMode
        ? newsLightImages
        : newsDarkImages;
    return CustomGeneralListViewBody(size: size, news: news);
  }
}
