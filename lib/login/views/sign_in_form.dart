import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pet_shelter/login/views/components/login_button.dart';
import 'package:pet_shelter/login/views/components/login_text_field.dart';
import 'package:pet_shelter/constants/app_strings.dart';

class SignInForm extends StatelessWidget {
  final double spacing;
  late final GlobalKey<FormState> _formKey;

  SignInForm(this.spacing, {Key? key}) : super(key: key) {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          children: [
            _buildEmailField(),
            SizedBox(height: spacing),
            _buildPasswordField(),
            SizedBox(height: spacing),
            LoginButton(
                AppStrings.signInButton,
                () { _formKey.currentState!.validate(); }
            )
          ]
      )
    );
  }

  Widget _buildEmailField() {
    return LoginFormField(
        AppStrings.emailFormFieldHint,
        (value) { },
        false,
        (value) {
          if (value == null || value.isEmpty) {
            return AppStrings.emptyFieldError;
          }
          if (!EmailValidator.validate(value)) {
            return AppStrings.emailFormatError;
          }
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
          if (value == null || value.isEmpty) {
            return AppStrings.emptyFieldError;
          }
          return null;
        }
    );
  }
}
