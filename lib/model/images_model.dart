import 'package:news_app/utils/app_assets.dart';

class ImagesModel {
  final String image;
  final String postions;
  final String category;
  ImagesModel({
    required this.image,
    required this.postions,
    required this.category,
  });

  static List<ImagesModel> lightImages = [
    ImagesModel(image: AppAssets.generalLightImage, postions: 'left', category: 'general'),
    ImagesModel(image: AppAssets.businessLightImage, postions: 'right', category: 'business'),
    ImagesModel(image: AppAssets.sportsLightImage, postions: 'left', category: 'sports'),
    ImagesModel(image: AppAssets.entertainmentLightImage, postions: 'left', category: 'entertainment'),
    ImagesModel(image: AppAssets.scienceLightImage, postions: 'left', category: 'science'),
    ImagesModel(image: AppAssets.healthLightImage, postions: 'right', category: 'health'),
    ImagesModel(image: AppAssets.technologyLightImage, postions: 'right', category: 'technology'),
  ];
  static List<ImagesModel> darkImages = [
    ImagesModel(image: AppAssets.generalDarkImage, postions: 'left', category: 'general'),
    ImagesModel(image: AppAssets.businessDarkImage, postions: 'right', category: 'business'),
    ImagesModel(image: AppAssets.sportsDarkImage, postions: 'left', category: 'sports'),
    ImagesModel(image: AppAssets.entertainmentDarkImage, postions: 'left', category: 'entertainment'),
    ImagesModel(image: AppAssets.scienceDarkImage, postions: 'left', category: 'science'),
    ImagesModel(image: AppAssets.healthDarkImage, postions: 'right', category: 'health'),
    ImagesModel(image: AppAssets.technologyDarkImage, postions: 'right', category: 'technology'),
  ];
}
