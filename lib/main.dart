import 'package:flutter/material.dart';
import 'package:news_app/screens/category/category_screen.dart';
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
import 'network_repos/remote_repos/app_api_service_impl.dart';
import 'screens/details/detail_screen.dart';
import 'screens/news_test_screen/news.dart';

void main() {
  AppApiServiceImpl.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(
          create: (_) => ArticleProvider()
            ..getNewsData()
            ..getCategoryNewsData("general")
            ..getCategoryNewsData("business")
            ..getCategoryNewsData("entertainment")
            ..getCategoryNewsData("health")
            ..getCategoryNewsData("science")
            ..getCategoryNewsData("sports")
            ..getCategoryNewsData("technology"),
        ),
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
      initialRoute: AppRoutes.newsRouteName,
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
