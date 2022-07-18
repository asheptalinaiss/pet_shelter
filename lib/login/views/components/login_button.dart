import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';

class LoginButton extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressedCallback;

  const LoginButton(this.labelText, this.onPressedCallback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedCallback,
      style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 18.5, horizontal: 33),
          textStyle: const TextStyle(
              fontFamily: AppAssets.mulishFontFamily,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
        )
      ),
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
