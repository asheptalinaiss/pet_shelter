import 'package:flutter/material.dart';
import 'package:pet_shelter/repository/local_storage.dart';

class AppState extends ChangeNotifier {
  final LocalStorage _localStorage;

  AppState(this._localStorage);

  bool isAuthorized() {
    print(_localStorage.getAccessToken());
    print(_localStorage.getRefreshToken());
    return _localStorage.getAccessToken() != null && _localStorage.getRefreshToken() != null;
  }

  void updateState() {
    notifyListeners();
  }
}