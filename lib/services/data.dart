import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  static Future<void> saveData(String key, String dataModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, dataModel);
  }

  static Future<String?> loadData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> removeData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  printAllShared() {
    print(
        "=-=-=-=-=-=-=-=-=-=-=-=-=-= INSIDE SHARED =-=-=-=-=-=-=-=-=-=-=-=-=-=");
    SharedPreferences.getInstance().then((prefs) {
      print(prefs.getKeys());
    });
  }
}
