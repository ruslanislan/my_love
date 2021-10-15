import 'package:my_love/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  static PreferencesProvider? _instance;
  SharedPreferences? _preferences;

  factory PreferencesProvider() {
    _instance ??= PreferencesProvider._();
    return _instance!;
  }

  PreferencesProvider._() {
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveFirstInit() async {
    await _initPreferences();
    return await _preferences!.setBool(KEY_FIRST_INIT, false);
  }

  Future<bool> isFirstInit() async {
    await _initPreferences();
    return _preferences!.getBool(KEY_FIRST_INIT) ?? true;
  }

  Future<bool> isPaid() async {
    await _initPreferences();
    return _preferences!.getBool(KEY_IS_PAID) ?? false;
  }

  Future<bool> savePaid() async {
    await _initPreferences();
    return _preferences!.setBool(KEY_IS_PAID, true);
  }
}
