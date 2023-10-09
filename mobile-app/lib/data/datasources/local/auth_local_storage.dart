import 'package:hive/hive.dart';
import 'package:alpha_eye/data/datasources/local/base/storage_keys.dart';

import 'base/hive_boxes.dart';
import 'base/local_storage_service.dart';

class AuthLocalStorage {
  final _localStorageService = LocalStorageService(Hive.box(HiveBoxes.authBox));

  void saveToken(String? value) {
    _localStorageService.save(StorageKeys.token, value);
  }

  String? getToken() {
    return _localStorageService.getString(StorageKeys.token);
  }
}
