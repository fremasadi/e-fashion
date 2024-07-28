import 'dart:convert';

import 'package:fashion_ecommerce/app/data/entities/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static set user(User? user) {
    final userString = user?.toJson();
    _prefs.setString('user', jsonEncode(userString));
  }

  static User? get user {
    final userString = _prefs.getString('user').toString();
    if (userString != 'null') {
      return User.fromJson(jsonDecode(userString));
    } else {
      return null;
    }
  }
}
