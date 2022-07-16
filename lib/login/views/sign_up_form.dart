import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/login/models/sign_up_model.dart';
import 'package:pet_shelter/login/services/login_validator.dart';
import 'package:pet_shelter/login/views/components/login_button.dart';
import 'package:pet_shelter/login/views/components/login_text_field.dart';

class SignUpForm extends StatelessWidget {
  final SignUpModel _signUpModel;
  final double _spacing;
  late final GlobalKey<FormState> _formKey;

  SignUpForm(this._signUpModel, this._spacing, {Key? key}) : super(key: key) {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            children: [
              _buildNameField(),
              SizedBox(height: _spacing),
              _buildEmailField(),
              SizedBox(height: _spacing),
              _buildPasswordField(),
              SizedBox(height: _spacing),
              _buildConfirmPasswordField(),
              SizedBox(height: _spacing),
              LoginButton(
                  AppStrings.signUpButton,
                  () {
                    if (_formKey.currentState!.validate())  {
                      _signUpModel.signUp();
                    }
                  }
              )
            ]
        )
    );
  }

  Widget _buildNameField() {
    return LoginFormField(
        AppStrings.nameFormFieldHint,
        (value) { 
          _signUpModel.onNameChanged(value);
        },
        false,
        (value) {
          return LoginValidator.validateName(value);
        }
    );
  }

  Widget _buildEmailField() {
    return LoginFormField(
        AppStrings.emailFormFieldHint,
        (value) { 
          _signUpModel.onEmailChanged(value);
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
          _signUpModel.onPasswordChanged(value);
        },
        true,
        (value) {
          return LoginValidator.validatePassword(value);
        }
    );
  }

  Widget _buildConfirmPasswordField() {
    return LoginFormField(
        AppStrings.confirmPasswordFormFieldHint,
        (value) {
          _signUpModel.onConfirmPasswordChanged(value);
        },
        true,
        (value) {
          return LoginValidator.validateConfirmPassword(_signUpModel.password, value);
        }
    );
  }
}
