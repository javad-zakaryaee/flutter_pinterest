import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class PreferencesService {
  Future<bool?> checkLogin() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool("loggedIn");
  }

  Future<bool> setLoginState(bool value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool("loggedIn", value);
  }
}
