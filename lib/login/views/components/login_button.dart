import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/main/global_styles.dart';

class LoginButton extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressedCallback;

  const LoginButton(this.labelText, this.onPressedCallback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedCallback,
      style: GlobalStyles.elevatedButtonStyle,
      child: Wrap(
        spacing: 11,
        children: [
          SvgPicture.asset(AppAssets.appMainIcon),
          Text(labelText)
        ],
      ),
    );
  }
}
