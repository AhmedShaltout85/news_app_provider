

abstract class AppRepository {

  Future<List<Map<String, dynamic>>> getNewsData();
  Future<List<Map<String, dynamic>>> getCategoryData(String category);
  Future<List<Map<String, dynamic>>> searchNewsData(String query);
}