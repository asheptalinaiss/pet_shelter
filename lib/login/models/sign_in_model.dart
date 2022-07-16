import 'package:flutter/material.dart';

class SignInModel extends ChangeNotifier {
  String _email = "";
  String _password = "";

  bool signInError = false;

  void onEmailChanged(String emailValue) {
    _email = emailValue;
  }

  void onPasswordChanged(String passwordValue) {
    _password = passwordValue;
  }

  void signIn() {
    // TODO: sign in
    signInError = true;
    notifyListeners();
  }
}