import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:together/src/config/constants/keys.dart';
import 'package:together/src/network/model/user.dart';

class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  WUser? getUser() {
    String? value = _prefs.getString(XKey.USER);
    if (value == null) return null;

    if (json.decode(value) == null) return null;

    return WUser.fromJson(value);
  }

  void saveUser(WUser user) {
    String value = user.toJson();
    _prefs.setString(XKey.USER, value);
  }

  void removeUser() {
    _prefs.remove(XKey.USER);
  }

  String? get getUserID => getUser()?.id;
}
