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
    ImagesModel(
        image: AppAssets.generalLightImage,
        postions: 'left',
        category: 'General'),
    ImagesModel(
        image: AppAssets.businessLightImage,
        postions: 'right',
        category: 'Business'),
    ImagesModel(
        image: AppAssets.sportsLightImage,
        postions: 'left',
        category: 'Sports'),
    ImagesModel(
        image: AppAssets.entertainmentLightImage,
        postions: 'left',
        category: 'Entertainment'),
    ImagesModel(
        image: AppAssets.scienceLightImage,
        postions: 'left',
        category: 'Science'),
    ImagesModel(
        image: AppAssets.healthLightImage,
        postions: 'right',
        category: 'Health'),
    ImagesModel(
        image: AppAssets.technologyLightImage,
        postions: 'right',
        category: 'Technology'),
  ];
  static List<ImagesModel> darkImages = [
    ImagesModel(
        image: AppAssets.generalDarkImage,
        postions: 'left',
        category: 'General'),
    ImagesModel(
        image: AppAssets.businessDarkImage,
        postions: 'right',
        category: 'Business'),
    ImagesModel(
        image: AppAssets.sportsDarkImage, postions: 'left', category: 'Sports'),
    ImagesModel(
        image: AppAssets.entertainmentDarkImage,
        postions: 'left',
        category: 'Entertainment'),
    ImagesModel(
        image: AppAssets.scienceDarkImage,
        postions: 'left',
        category: 'Science'),
    ImagesModel(
        image: AppAssets.healthDarkImage,
        postions: 'right',
        category: 'Health'),
    ImagesModel(
        image: AppAssets.technologyDarkImage,
        postions: 'right',
        category: 'Technology'),
  ];
}
