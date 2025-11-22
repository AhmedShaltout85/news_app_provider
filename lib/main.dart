import 'package:flutter/material.dart';
import 'package:news_app/screens/general/category_screen.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/controller/locale_provider.dart';
import 'package:news_app/controller/theme_provider.dart';
import 'package:news_app/screens/search/search_screen.dart';
import 'package:news_app/screens/splash/splash_screen.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

import 'controller/articale_provider.dart';
import 'screens/details/detail_screen.dart';
import 'screens/news_test_screen/news.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ArticleProvider()..getNewsData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.splashRouteName: (context) => SplashScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.categoryRouteName: (context) => CategoryScreen(),
        AppRoutes.detailRouteName: (context) => DetailScreen(),
        AppRoutes.searchRouteName: (context) => SearchScreen(),
        AppRoutes.newsRouteName: (context) => NewsScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      locale: localeProvider.locale,
    
    );
  }
}

/// utils :
/// 1- colors
/// 2- routeNames
/// 3- assets => images
/// 4- theme => light , dark mode
