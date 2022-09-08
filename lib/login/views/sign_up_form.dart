import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/login/services/login_validator.dart';
import 'package:pet_shelter/login/states/sign_up_state.dart';
import 'package:pet_shelter/login/views/components/login_button.dart';
import 'package:pet_shelter/login/views/components/login_text_field.dart';
import 'package:pet_shelter/main/views/main_screen.dart';

class SignUpForm extends StatelessWidget {
  final SignUpState _signUpState;
  final double _spacing;
  late final GlobalKey<FormState> _formKey;

  SignUpForm(this._signUpState, this._spacing, {Key? key}) : super(key: key) {
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
                      _signUpState.signUp(
                          () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => const MainScreenView()));
                          }
                      );
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
          _signUpState.onNameChanged(value);
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
          _signUpState.onEmailChanged(value);
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
          _signUpState.onPasswordChanged(value);
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
          _signUpState.onConfirmPasswordChanged(value);
        },
        true,
        (value) {
          return LoginValidator.validateConfirmPassword(_signUpState.password, value);
        }
    );
  }
}
