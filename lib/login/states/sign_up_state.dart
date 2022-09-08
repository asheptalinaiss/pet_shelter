import 'package:flutter/material.dart';
import 'package:pet_shelter/models/sign_up_request/sign_up_request.dart';
import 'package:pet_shelter/repository/local_storage.dart';
import 'package:pet_shelter/services/basic_network_service.dart';

class SignUpState extends ChangeNotifier {
  String _name = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  final BasicNetworkService _networkService;
  final LocalStorage _localStorage;

  String? get password => _password;
  bool signUpError = false;

  SignUpState(this._networkService, this._localStorage);

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

  Future<void> signUp(VoidCallback onSuccess) async {
    var result = await _networkService.signUp(
      SignUpRequest(
        email: _email,
        password: _password,
        userName: _name
      )
    );
    if (result.success) {
      if (result.body != null) {
        _localStorage.saveAccessToken(result.body!.accessToken);
        _localStorage.saveRefreshToken(result.body!.refreshToken);
        onSuccess();
      } else {
        signUpError = true;
      }
    } else {
      // TODO: add handlers for different errors
      signUpError = true;
      notifyListeners();
    }
  }
}