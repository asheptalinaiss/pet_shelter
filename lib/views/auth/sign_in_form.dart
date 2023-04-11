import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/states/auth/sign_in_state.dart';
import 'package:pet_shelter/views/components/button.dart';
import 'package:pet_shelter/views/components/custom_form_field.dart';
import 'package:pet_shelter/ui_constants/global_styles.dart';
import 'package:pet_shelter/states/app_state.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatelessWidget {
  final SignInState _signInState;
  final double _spacing;

  const SignInForm(this._signInState, this._spacing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildErrorMessage(),
          _buildForm(context),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    return Column(
        children: [
          _buildEmailField(),
          SizedBox(height: _spacing),
          _buildPasswordField(),
          SizedBox(height: _spacing),
          Button(
              labelText: AppStrings.signInButton,
              iconName: AppAssets.appMainIcon,
              onPressedCallback: () => _signInState.signIn(() => appState.updateState())
          )
        ]
    );
  }
  Widget _buildErrorMessage() {
    if (_signInState.signInError != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, _spacing),
        child: Text(
          _signInState.signInError!,
          style: GlobalStyles.errorTextStyle,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildEmailField() {
    return CustomFormField(
      value: _signInState.email,
      labelText: AppStrings.emailFormFieldHint,
      onChanged: (value) => _signInState.onEmailChanged(value),
      errorText: _signInState.emailError,
      inputType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return CustomFormField(
      value: _signInState.password,
      labelText: AppStrings.passwordFormFieldHint,
      onChanged: (value) => _signInState.onPasswordChanged(value),
      obscureText: true,
      errorText: _signInState.passwordError,
    );
  }
}
