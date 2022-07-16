import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
  String _name = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  String? get password => _password;

  void onNameChanged(String nameValue) {
    _name = nameValue;
  }

  void onEmailChanged(String emailValue) {
    _email = emailValue;
  }

  void onPasswordChanged(String passwordValue) {
    _password = passwordValue;
  }

  void onConfirmPasswordChanged(String confirmPasswordValue) {
    _confirmPassword = confirmPasswordValue;
  }

  void signUp() {
    // TODO: sign up
  }
}