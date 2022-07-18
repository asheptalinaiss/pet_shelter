import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/login/ui_constants/login_style.dart';

class LoginLaterButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginLaterButton(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: LoginStyle.textButtonStyle,
        child: Wrap(
          spacing: 8,
          children: const [
            Text(AppStrings.logInLaterButton),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.blackText,
              size: 16,
            )
          ],
        )
    );
  }
}
