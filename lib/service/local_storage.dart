import 'package:flutter_assignment/Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!);
  }

  save(String key,User value) async {
    final prefs = await SharedPreferences.getInstance();
    bool r = await prefs.setString(key, json.encode(value));

print(r);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool r = await prefs.remove(key);
  }
}
