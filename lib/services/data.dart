import 'dart:async';

import 'package:flutter/material.dart';
import 'package:migraine_meter/models/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  static Future<void> saveData(String key, String dataModel) async {
    final prefs = await SharedPreferences.getInstance();
    final allPrefs = prefs.getKeys();
    if (allPrefs.contains(key)) {
      String now = DateTime.now().millisecond.toString() +
          DateTime.now().microsecond.toString();
      key = key + " " + now.toString();
    }
    prefs.setString(key, dataModel);
  }

  static Future<List<String>> loadData(String keyPrefix) async {
    final prefs = await SharedPreferences.getInstance();
    final allPrefs = prefs.getKeys();
    List<String> matchingValues = [];

    for (String key in allPrefs) {
      if (key.startsWith(keyPrefix)) {
        String? value = prefs.getString(key);
        if (value != null) {
          matchingValues.add(value);
        }
      }
    }
    if (matchingValues.isEmpty) {
      matchingValues.add("No data");
    }
    return matchingValues;
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
