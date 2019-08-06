import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {

  SharedPreferences sharedPreferences;

  static final SharedPrefHelper _instance = SharedPrefHelper._internal();
  factory SharedPrefHelper() => _instance;

  SharedPrefHelper._internal() {
    // init things inside this
  }

  // ignore: missing_return
  Future<dynamic> save(String key, dynamic value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (value is int) {
      return await sharedPreferences.setInt(key, value) as dynamic;
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value) as dynamic;
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value) as dynamic;
    } else if (value is String) {
      return await sharedPreferences.setString(key, value) as dynamic;
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value) as dynamic;
    }
  }

  Future<dynamic> get(String key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.get(key) as Future<dynamic>;
  }

  Future<dynamic> getWithDefault(String key, dynamic defValue) async {
    sharedPreferences = await SharedPreferences.getInstance();
    Future<dynamic> returnValue = sharedPreferences.get(key);
    return returnValue == null ? defValue : await sharedPreferences.get(key);
  }

}
