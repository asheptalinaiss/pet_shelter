import 'package:flutter/material.dart';
import 'package:pet_shelter/login/services/login_validator.dart';
import 'package:pet_shelter/login/states/sign_in_state.dart';
import 'package:pet_shelter/login/ui_constants/login_style.dart';
import 'package:pet_shelter/login/views/components/login_button.dart';
import 'package:pet_shelter/login/views/components/login_text_field.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/main/views/main_screen.dart';

class SignInForm extends StatelessWidget {
  final SignInState _signInState;
  final double _spacing;
  late final GlobalKey<FormState> _formKey;

  SignInForm(this._signInState, this._spacing, {Key? key}) : super(key: key) {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildErrorMessage(),
        _buildForm(context),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
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
                    // _signInState.clearError();
                    if (_formKey.currentState!.validate())  {
                      _signInState.signIn(
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
  Widget _buildErrorMessage() {
    if (_signInState.errorMessage != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, _spacing),
        child: Text(
          _signInState.errorMessage!,
          style: LoginStyle.errorTextStyle,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildEmailField() {
    return LoginFormField(
        AppStrings.emailFormFieldHint,
        (value) {
          _signInState.onEmailChanged(value);
          // _signInState.clearError();
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
          _signInState.onPasswordChanged(value);
        },
        true,
        (value) {
          final String? error = LoginValidator.validatePassword(value);
          if (error != null) {
            return error;
          } else {
            return _signInState.errorMessage != null ? AppStrings.wrongPasswordError : null;
          }
        }
    );
  }
}
