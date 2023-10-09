import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:alpha_eye/data/datasources/local/base/hive_boxes.dart';

class LocalStorageService {
  LocalStorageService(this.box);
  final Box box;

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveBoxes.appBox);
    await Hive.openBox(HiveBoxes.authBox);
  }

  save(String key, String? value) {
    box.put(key, value);
  }

  saveMap(String key, Map? value) {
    box.put(key, value == null ? null : jsonEncode(value));
  }

  Map<String, dynamic>? getMap(String key) {
    final res = box.get(key, defaultValue: null);
    return res == null ? null : jsonDecode(res);
  }

  String? getString(String key) {
    return box.get(key, defaultValue: null);
  }

  int? getInt(String key) {
    return box.get(key, defaultValue: null);
  }

  bool? getBool(String key) {
    return box.get(key, defaultValue: null);
  }

  double? getDouble(String key) {
    return box.get(key, defaultValue: null);
  }

  Future<void> clear() async {
    await Hive.box(HiveBoxes.appBox).clear();
    await Hive.box(HiveBoxes.authBox).clear();
    //appGlobals.token = null;
  }
}
