import 'package:news_app/utils/app_assets.dart';

class ImagesModel {
 final String image; 
 final String postions; 
 ImagesModel({required this.image, required this.postions});

 static List<ImagesModel> lightImages = [
  ImagesModel(image: AppAssets.generalLightImage, postions: 'left'),
   ImagesModel(image: AppAssets.businessLightImage, postions: 'right'),
   ImagesModel(image: AppAssets.sportsLightImage, postions: 'left'),
   ImagesModel(image: AppAssets.entertainmentLightImage, postions: 'left'),
   ImagesModel(image: AppAssets.scienceLightImage, postions: 'left'),
   ImagesModel(image: AppAssets.healthLightImage, postions: 'right'),
   ImagesModel(image: AppAssets.technologyLightImage, postions: 'right'),
  ];
 static List<ImagesModel> darkImages = [
  ImagesModel(image: AppAssets.generalDarkImage, postions: 'left'),
   ImagesModel(image: AppAssets.businessDarkImage, postions: 'right'),
   ImagesModel(image: AppAssets.sportsDarkImage, postions: 'left'),
   ImagesModel(image: AppAssets.entertainmentDarkImage, postions: 'left'),
   ImagesModel(image: AppAssets.scienceDarkImage, postions: 'left'),
   ImagesModel(image: AppAssets.healthDarkImage, postions: 'right'),
   ImagesModel(image: AppAssets.technologyDarkImage, postions: 'right'),
  ];
}