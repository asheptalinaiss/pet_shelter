import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/login/services/login_validator.dart';
import 'package:pet_shelter/models/sign_in_request/sign_in_request.dart';
import 'package:pet_shelter/repository/local_storage.dart';
import 'package:pet_shelter/services/basic_network_service.dart';

class SignInState extends ChangeNotifier {
  String _email = "";
  String _password = "";

  final BasicNetworkService _networkService;
  final LocalStorage _localStorage;

  String? emailError;
  String? passwordError;

  String? signInError;

  SignInState(this._networkService, this._localStorage);

  String? get email => _email;
  String? get password => _password;

  void onEmailChanged(String emailValue) {
    _email = emailValue;
  }

  void onPasswordChanged(String passwordValue) {
    _password = passwordValue;
  }

  Future<void> signIn(VoidCallback onSuccess) async {
    signInError = null;
    if (!validateFields()) {
      notifyListeners();
      return;
    }

    var result = await _networkService.signIn(
      SignInRequest(email: _email, password: _password)
    );

    if (result.success) {
      if (result.body != null) {
        _localStorage.saveAccessToken(result.body!.accessToken);
        _localStorage.saveRefreshToken(result.body!.refreshToken);
        onSuccess();
      } else {
        signInError = AppStrings.defaultErrorMessage;
      }
    } else {
      // TODO: add handlers for different errors
      signInError = AppStrings.defaultErrorMessage;
      notifyListeners();
    }
  }

  bool validateFields() {
    emailError = LoginValidator.validateEmail(_email);
    passwordError = LoginValidator.validatePassword(_password);
    return emailError == null && passwordError == null;
  }
}
