import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  static Future<void> saveData(String key, dateData value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value.toString());
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
}

class dateData {
  final String date;
  final int intensity;
  final String type;
  final List<String> sideEffects;

  dateData(this.date, this.intensity, this.type, this.sideEffects);
}
