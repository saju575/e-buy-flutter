import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  //   final SharedPreferences _pref;

  //   SharedPrefService(this._pref);

  static late final SharedPrefService _instance;
  static late final SharedPreferences _pref;

  // Private constructor
  SharedPrefService._internal();

  // Factory constructor to return the same instance
  factory SharedPrefService() {
    return _instance;
  }

  // Initialize the service (must be called before using SharedPrefService())
  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
    _instance = SharedPrefService._internal();
  }

  String? getString(String key) => _pref.getString(key);

  Future<bool> setString(String key, String value) async =>
      await _pref.setString(key, value);

  int? getInt(String key) => _pref.getInt(key);

  Future<bool> setInt(String key, int value) async =>
      await _pref.setInt(key, value);

  bool? getBool(String key) => _pref.getBool(key);

  Future<bool> setBool(String key, bool value) async =>
      await _pref.setBool(key, value);

  double? getDouble(String key) => _pref.getDouble(key);

  Future<bool> setDouble(String key, double value) async =>
      await _pref.setDouble(key, value);

  List<String>? getStringList(String key) => _pref.getStringList(key);

  Future<bool> setStringList(String key, List<String> value) async =>
      await _pref.setStringList(key, value);

  Future<bool> remove(String key) async => await _pref.remove(key);

  Future<bool> clear() async => await _pref.clear();

  bool containsKey(String key) => _pref.containsKey(key);
}
