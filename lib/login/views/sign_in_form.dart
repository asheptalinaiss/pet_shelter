import 'package:flutter/material.dart';
import 'package:pet_shelter/login/services/login_validator.dart';
import 'package:pet_shelter/login/models/sign_in_model.dart';
import 'package:pet_shelter/login/views/components/login_button.dart';
import 'package:pet_shelter/login/views/components/login_text_field.dart';
import 'package:pet_shelter/constants/app_strings.dart';

class SignInForm extends StatelessWidget {
  final SignInModel _signInModel;
  final double _spacing;
  late final GlobalKey<FormState> _formKey;

  SignInForm(this._signInModel, this._spacing, {Key? key}) : super(key: key) {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          children: [
            _buildEmailField(),
            SizedBox(height: _spacing),
            _buildPasswordField(),
            SizedBox(height: _spacing),
            LoginButton(
                AppStrings.signInButton,
                () {
                  if (_formKey.currentState!.validate())  {
                    _signInModel.signIn();
                  }
                }
            )
          ]
      )
    );
  }

  Widget _buildEmailField() {
    return LoginFormField(
        AppStrings.emailFormFieldHint,
        (value) {
          _signInModel.onEmailChanged(value);
        },
        false,
        (value) {
          return LoginValidator.validateEmail(value);
        }
    );
  }

  Widget _buildPasswordField() {
    return LoginFormField(
        AppStrings.passwordFormFieldHint,
        (value) {
          _signInModel.onPasswordChanged(value);
        },
        true,
        (value) {
          final String? error = LoginValidator.validatePassword(value);
          if (error != null) {
            return error;
          } else {
            return _signInModel.signInError ? AppStrings.wrongPasswordError : null;
          }
        }
    );
  }
}
