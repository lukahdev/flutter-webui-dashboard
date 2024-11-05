import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:webui/helper/localization/language.dart';
import 'package:webui/helper/services/auth_services.dart';
import 'package:webui/helper/theme/theme_customizer.dart';
import 'package:webui/models/user.dart';

class LocalStorage {
  static const String _loggedInUserKey = "user";
  static const String _loggedInUserDataKey = "user_data";
  static const String _themeCustomizerKey = "theme_customizer";
  static const String _languageKey = "lang_code";

  static SharedPreferences? _preferencesInstance;

  static SharedPreferences get preferences {
    if (_preferencesInstance == null) {
      throw ("Call LocalStorage.init() to initialize local storage");
    }
    return _preferencesInstance!;
  }

  static Future<void> init() async {
    _preferencesInstance = await SharedPreferences.getInstance();
    await initData();
  }

  static Future<void> initData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AuthService.isLoggedIn = preferences.getBool(_loggedInUserKey) ?? false;
    ThemeCustomizer.fromJSON(preferences.getString(_themeCustomizerKey));
  }

  static Future<bool> setLoggedInUser(bool loggedIn) async {
    return preferences.setBool(_loggedInUserKey, loggedIn);
  }

  // static Future<bool> setLoggedInUserData(bool loggedIn) async {
  //   return preferences.setString(_loggedInUserDataKey, loggedIn.toString());
  // }

  static Future<bool> setLoggedInUserData(User authUserData) async {
    return preferences.setString(_loggedInUserDataKey, authUserData.toJsonString());
  }

  static User getLoggedInUserData() {
    return User.fromJson(jsonDecode(preferences.getString(_loggedInUserDataKey)!));
  }

  static Future<bool> setCustomizer(ThemeCustomizer themeCustomizer) {
    return preferences.setString(_themeCustomizerKey, themeCustomizer.toJSON());
  }

  static Future<bool> setLanguage(Language language) {
    return preferences.setString(_languageKey, language.locale.languageCode);
  }

  static String? getLanguage() {
    return preferences.getString(_languageKey);
  }

  static Future<bool> removeLoggedInUser() async {
    return preferences.remove(_loggedInUserKey);
  }
}
