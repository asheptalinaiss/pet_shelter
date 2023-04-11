import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/states/auth/sign_up_state.dart';
import 'package:pet_shelter/views/components/button.dart';
import 'package:pet_shelter/views/components/custom_form_field.dart';
import 'package:pet_shelter/states/app_state.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  final SignUpState _signUpState;
  final double _spacing;

  const SignUpForm(this._signUpState, this._spacing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    return SingleChildScrollView(
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
            Button(
                labelText: AppStrings.signUpButton,
                iconName: AppAssets.appMainIcon,
                onPressedCallback: () => _signUpState.signUp(
                        () => appState.updateState()
                )
            )
          ]
      ),
    );
  }

  Widget _buildNameField() {
    return CustomFormField(
      value: _signUpState.name,
      labelText: AppStrings.nameFormFieldHint,
      onChanged: (value) => _signUpState.onNameChanged(value),
      errorText: _signUpState.nameError
    );
  }

  Widget _buildEmailField() {
    return CustomFormField(
      value: _signUpState.email,
      labelText: AppStrings.emailFormFieldHint,
      onChanged: (value) => _signUpState.onEmailChanged(value),
      errorText: _signUpState.emailError,
      inputType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return CustomFormField(
      value: _signUpState.password,
      labelText: AppStrings.passwordFormFieldHint,
      onChanged: (value) => _signUpState.onPasswordChanged(value),
      obscureText: true,
      errorText: _signUpState.passwordError,
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomFormField(
      value: _signUpState.confirmPassword,
      labelText: AppStrings.confirmPasswordFormFieldHint,
      onChanged: (value) => _signUpState.onConfirmPasswordChanged(value),
      obscureText: true,
      errorText: _signUpState.confirmPasswordError,
    );
  }
}
