import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.medium20Black
    ),
     drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.blackColor,

      ),
      listTileTheme: ListTileThemeData(
        textColor: AppColors.whiteColor,
        iconColor: AppColors.whiteColor
      ),
     
    
  );
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
      ),
      textTheme: TextTheme(
          headlineLarge: AppStyles.medium20White
      ),
     
  );
}