import 'dart:async';

import 'package:flutter/material.dart';
import 'package:migraine_meter/models/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {

  static Future<void> saveData(String key, String dataModel) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, dataModel);


  }

  static Future<String?> loadData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

 void printAllSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final allPrefs = prefs.getKeys();

    print('======= All SharedPreferences =======');
    for (var key in allPrefs) {
      final value = prefs.get(key);
      print('$key: $value');
    }
    print('======= End of SharedPreferences =======');
  }
}
