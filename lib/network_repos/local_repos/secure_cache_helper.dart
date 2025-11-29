import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheHelper {
  // Create storage
  static final secureStorage = FlutterSecureStorage();

// Save data
  static Future<void> saveSecureData({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

// Read data
  static Future<String?> getSecureData({required String key}) async {
    return await secureStorage.read(key: key);
  }
// Delete data
  static Future<void> deleteSecureData({required String key}) async {
    await secureStorage.delete(key: key);
  }
// Delete all data
  static Future<void> deleteAllSecureData() async {
    await secureStorage.deleteAll();
  }
}
