import 'package:hive/hive.dart';
import 'package:alpha_eye/core/states/app_state.dart';
import 'package:alpha_eye/data/datasources/local/base/local_storage_service.dart';

import '../../data.dart';
import 'base/hive_boxes.dart';
import 'base/storage_keys.dart';

class AppLocalStorage {
  final _localStorageService = LocalStorageService(Hive.box(HiveBoxes.authBox));

  void saveAppState(String value) {
    _localStorageService.save(StorageKeys.appState, value);
  }

  String getAppState() {
    return _localStorageService.getString(StorageKeys.appState) ??
        AppState.unauthenticated;
  }

  void saveUser(User? user) {
    _localStorageService.saveMap(StorageKeys.appUser, user?.toJson());
  }

  User? getUser() {
    final res = _localStorageService.getMap(StorageKeys.appUser);
    if (res == null) return null;
    return User.fromJson(res);
  }
}
