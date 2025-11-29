// import 'package:flutter/material.dart';

// class LocaleProvider extends ChangeNotifier {
//   Locale _locale = const Locale('en');

//   Locale get locale => _locale;

//   void setLocale(Locale locale) {
//     _locale = locale;
//     notifyListeners();
//   }
// }
// locale_provider.dart
import 'package:flutter/material.dart';
import 'package:news_app/network_repos/local_repos/cache_helper.dart';
class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  final CacheHelper _prefsService;

  LocaleProvider(this._prefsService);

  Locale get locale => _locale;

  // Load locale from SharedPreferences
  Future<void> loadLocaleFromPrefs() async {
    final savedLocale = _prefsService.getLocale();

    if (savedLocale != null) {
      _locale = Locale(savedLocale);
      notifyListeners();
    }
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();

    // Save to SharedPreferences
    _prefsService.saveLocale(locale.languageCode);
  }
}
