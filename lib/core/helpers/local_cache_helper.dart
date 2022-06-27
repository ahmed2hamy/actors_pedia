import 'package:shared_preferences/shared_preferences.dart';

class LocalCacheHelper {
  const LocalCacheHelper({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  String? getJson(String key) {
    String? res = _sharedPreferences.getString(key);
    return res;
  }

  Future<bool> cacheJson(String key, String value) async {
    bool res = await _sharedPreferences.setString(key, value);
    return res;
  }
}
