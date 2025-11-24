// import 'package:flutter/material.dart';

// class ThemeProvider extends ChangeNotifier {
//   ThemeMode _themeMode = ThemeMode.light;

//   ThemeMode get themeMode => _themeMode;

//   void setTheme(ThemeMode mode) {
//     _themeMode = mode;
//     notifyListeners();
//   }
// }

// theme_provider.dart
import 'package:flutter/material.dart';
import 'package:news_app/network_repos/local_repos/cached_data.dart';
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final SharedPreferencesService _prefsService;

  ThemeProvider(this._prefsService);

  ThemeMode get themeMode => _themeMode;

  // Load theme from SharedPreferences
  Future<void> loadThemeFromPrefs() async {
    final savedTheme = _prefsService.getThemeMode();

    if (savedTheme != null) {
      _themeMode = _parseThemeMode(savedTheme);
      notifyListeners();
    }
  }

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();

    // Save to SharedPreferences
    _prefsService.saveThemeMode(_themeModeToString(mode));
  }

  // Helper methods to convert between ThemeMode and String
  ThemeMode _parseThemeMode(String theme) {
    switch (theme) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.system:
        return 'system';
    }
  }
}
