import 'package:shared_preferences/shared_preferences.dart';

class AppShareStorage {
  static SharedPreferences? storage;

  static Future<SharedPreferences> getInstance() async {
    storage ??= await _initDatabase();

    return storage!;
  }

  static Future<SharedPreferences> _initDatabase() async {
    return await SharedPreferences.getInstance();
  }
}
