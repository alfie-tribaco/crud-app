import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SPCache {
  Future<bool?> getDarkModeCache() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool('isDarkMode');
    } catch (e) {
      log('Shared Preference Cache Exception: $e');
      return null;
    }
  }

  Future<void> setDarkModeCache(bool state) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', state);
    } catch (e) {
      log('Shared Preference Cache Exception: $e');
    }
  }
}
