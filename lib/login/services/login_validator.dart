import 'package:email_validator/email_validator.dart';
import 'package:pet_shelter/constants/app_strings.dart';

class LoginValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return AppStrings.emptyFieldError;
    }
    if (!EmailValidator.validate(email)) {
      return AppStrings.emailFormatError;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    return password == null || password.isEmpty ? AppStrings.emptyFieldError : null;
  }

  static String? validateName(String? name) {
    return name == null || name.isEmpty ? AppStrings.emptyFieldError : null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppStrings.emptyFieldError;
    }
    if (confirmPassword != password) {
      return AppStrings.differentPasswordsError;
    }
    return null;
  }
}