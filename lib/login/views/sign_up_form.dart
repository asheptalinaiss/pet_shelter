import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/login/views/components/login_button.dart';
import 'package:pet_shelter/login/views/components/login_text_field.dart';

class SignUpForm extends StatelessWidget {
  final double spacing;
  late final GlobalKey<FormState> _formKey;

  SignUpForm(this.spacing, {Key? key}) : super(key: key) {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            children: [
              _buildNameField(),
              SizedBox(height: spacing),
              _buildEmailField(),
              SizedBox(height: spacing),
              _buildPasswordField(),
              SizedBox(height: spacing),
              _buildRepeatPasswordField(),
              SizedBox(height: spacing),
              LoginButton(
                  AppStrings.signUpButton,
                  () { _formKey.currentState!.validate(); }
              )
            ]
        )
    );
  }

  Widget _buildNameField() {
    return LoginFormField(
        AppStrings.nameFormFieldHint,
        (value) { },
        false,
        (value) {
          return null;
        }
    );
  }

  Widget _buildEmailField() {
    return LoginFormField(
        AppStrings.emailFormFieldHint,
        (value) { },
        false,
        (value) {
          return null;
        }
    );
  }

  Widget _buildPasswordField() {
    return LoginFormField(
        AppStrings.passwordFormFieldHint,
        (value) { },
        true,
        (value) {
          return null;
        }
    );
  }

  Widget _buildRepeatPasswordField() {
    return LoginFormField(
        AppStrings.repeatPasswordFormFieldHint,
        (value) { },
        true,
        (value) {
          return null;
        }
    );
  }
}
