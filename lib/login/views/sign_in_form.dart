import 'package:flutter/material.dart';
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
                      if (_formKey.currentState!.validate()) {
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
    if (_signInState.signInError != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, _spacing),
        child: Text(
          _signInState.signInError!,
          style: LoginStyle.errorTextStyle,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildEmailField() {
    return LoginFormField(
        _signInState.email,
        AppStrings.emailFormFieldHint,
        (value) {
          _signInState.onEmailChanged(value);
        },
        false,
        _signInState.emailError
    );
  }

  Widget _buildPasswordField() {
    return LoginFormField(
        _signInState.password,
        AppStrings.passwordFormFieldHint,
        (value) {
          _signInState.onPasswordChanged(value);
        },
        true,
        _signInState.passwordError
    );
  }
}
