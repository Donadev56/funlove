import 'package:funlove/utils/logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  final prefsInstance = SharedPreferences.getInstance();

  Future<bool> save({required String data, required String key}) async {
    try {
      final prefs = await prefsInstance;
      prefs.setString(key, data);
      return true;
    } catch (e) {
      logError(e.toString());
      return false;
    }
  }

  Future<bool> remove(String key) async {
    try {
      final prefs = await prefsInstance;
      prefs.remove(key);
      return true;
    } catch (e) {
      logError(e.toString());
      return false;
    }
  }

  Future<String?> get(String key) async {
    try {
      final prefs = await prefsInstance;
      return prefs.getString(key);
    } catch (e) {
      logError(e.toString());
      return null;
    }
  }
}
