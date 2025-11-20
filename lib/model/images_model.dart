import 'package:news_app/utils/app_assets.dart';

class ImagesModel {
  final String image;
  final String postions;
  final String catigery;
  ImagesModel({
    required this.image,
    required this.postions,
    required this.catigery,
  });

  static List<ImagesModel> lightImages = [
    ImagesModel(image: AppAssets.generalLightImage, postions: 'left', catigery: 'general'),
    ImagesModel(image: AppAssets.businessLightImage, postions: 'right', catigery: 'business'),
    ImagesModel(image: AppAssets.sportsLightImage, postions: 'left', catigery: 'sports'),
    ImagesModel(image: AppAssets.entertainmentLightImage, postions: 'left', catigery: 'entertainment'),
    ImagesModel(image: AppAssets.scienceLightImage, postions: 'left', catigery: 'science'),
    ImagesModel(image: AppAssets.healthLightImage, postions: 'right', catigery: 'health'),
    ImagesModel(image: AppAssets.technologyLightImage, postions: 'right', catigery: 'technology'),
  ];
  static List<ImagesModel> darkImages = [
    ImagesModel(image: AppAssets.generalDarkImage, postions: 'left', catigery: 'general'),
    ImagesModel(image: AppAssets.businessDarkImage, postions: 'right', catigery: 'business'),
    ImagesModel(image: AppAssets.sportsDarkImage, postions: 'left', catigery: 'sports'),
    ImagesModel(image: AppAssets.entertainmentDarkImage, postions: 'left', catigery: 'entertainment'),
    ImagesModel(image: AppAssets.scienceDarkImage, postions: 'left', catigery: 'science'),
    ImagesModel(image: AppAssets.healthDarkImage, postions: 'right', catigery: 'health'),
    ImagesModel(image: AppAssets.technologyDarkImage, postions: 'right', catigery: 'technology'),
  ];
}
