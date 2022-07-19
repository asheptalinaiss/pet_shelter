import 'package:flutter/material.dart';
import 'package:pet_shelter/services/basic_network_service.dart';

class SignUpModel extends ChangeNotifier {
  String _name = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  final BasicNetworkService _networkService;

  String? get password => _password;

  SignUpModel(this._networkService);

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

  Future<void> signUp() async {
    try {
      // TODO: sign up
      await _networkService.healthCheck();
    } catch(error) {
      print("Network Service error: $error");
    }
  }
}