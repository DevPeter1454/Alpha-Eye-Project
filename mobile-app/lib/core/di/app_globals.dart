import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../cores.dart';

class AppGlobals extends ChangeNotifier {
  static AppGlobals instance = AppGlobals._();
  AppGlobals._();

  String? _token;
  User? _user;

  Future<void> init() async {
    _token = authLocalStorage.getToken();
    _user = appLocalStorage.getUser();
  }

  ///TODO: Remove this
  String get userType => user?.role ?? UserType.buyer;

  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  String? get token => _token;
  User? get user => _user;
}
