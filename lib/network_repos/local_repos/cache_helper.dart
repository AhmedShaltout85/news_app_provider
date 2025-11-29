// shared_preferences_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static CacheHelper? _instance;
  static SharedPreferences? _preferences;

  CacheHelper._internal();

  static Future<CacheHelper> getInstance() async {
    _instance ??= CacheHelper._internal();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // Theme methods
  Future<void> saveThemeMode(String themeMode) async {
    await _preferences?.setString('theme_mode', themeMode);
  }

  String? getThemeMode() {
    return _preferences?.getString('theme_mode');
  }

  // Locale methods
  Future<void> saveLocale(String languageCode) async {
    await _preferences?.setString('locale', languageCode);
  }

  String? getLocale() {
    return _preferences?.getString('locale');
  }

  // Clear all preferences (optional)
  Future<void> clearAllPreferences() async {
    await _preferences?.clear();
  }

  // Remove a specific preference (optional)
  Future<void> removePreference(String key) async {
    await _preferences?.remove(key);
  }

  // Add more methods as needed for other preferences
  static Future<void> saveData({required String key, required dynamic value}) async {
    if (value is String) {
       await _preferences?.setString(key, value) ?? false;
    } else if (value is int) {
       await _preferences?.setInt(key, value) ?? false;
    } else if (value is bool) {
       await _preferences?.setBool(key, value) ?? false;
    } else if (value is double) {
       await _preferences?.setDouble(key, value) ?? false;
    } else if (value is List<String>) {
       await _preferences?.setStringList(key, value) ?? false;
    } else {
      throw Exception('Unsupported value type');
    }
  }

  static dynamic getData(String key) {
    return _preferences?.get(key);
  }
}
