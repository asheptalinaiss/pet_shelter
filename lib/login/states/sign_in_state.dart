import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/models/sign_in_request/sign_in_request.dart';
import 'package:pet_shelter/repository/local_storage.dart';
import 'package:pet_shelter/services/basic_network_service.dart';

class SignInState extends ChangeNotifier {
  String _email = "";
  String _password = "";

  final BasicNetworkService _networkService;
  final LocalStorage _localStorage;

  SignInState(this._networkService, this._localStorage);

  String? errorMessage;

  void onEmailChanged(String emailValue) {
    _email = emailValue;
  }

  void onPasswordChanged(String passwordValue) {
    _password = passwordValue;
  }

  Future<void> signIn(VoidCallback onSuccess) async {
    var result = await _networkService.signIn(
      SignInRequest(email: _email, password: _password)
    );

    if (result.success) {
      if (result.body != null) {
        _localStorage.saveAccessToken(result.body!.accessToken);
        _localStorage.saveRefreshToken(result.body!.refreshToken);
        onSuccess();
      } else {
        errorMessage = AppStrings.defaultErrorMessage;
      }
    } else {
      // TODO: add handlers for different errors
      errorMessage = AppStrings.defaultErrorMessage;
      notifyListeners();
    }
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
