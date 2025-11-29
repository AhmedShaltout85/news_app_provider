// shared_preferences_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  SharedPreferencesService._internal();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._internal();
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
  Future<void> clearPreferences() async {
    await _preferences?.clear();
  }

  // Add more methods as needed for other preferences
  Future<bool> saveData(String key, dynamic value) async {

    if(value is String) return await _preferences?.setString(key, value) ?? false;
    if(value is int) return await _preferences?.setInt(key, value) ?? false;
    if(value is bool) return await _preferences?.setBool(key, value) ?? false;
    if(value is double) return await _preferences?.setDouble(key, value) ?? false;
    if(value is List<String>) return await _preferences?.setStringList(key, value) ?? false;
    return await _preferences?.setDouble(key, value) ?? false;
  }

  dynamic getData(String key) {
    return _preferences?.get(key);
  }
}
