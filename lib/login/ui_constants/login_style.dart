import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';

class LoginStyle {
  static ButtonStyle textButtonStyle = TextButton.styleFrom(
      primary: AppColors.blackText,
      textStyle: const TextStyle(
          fontFamily: AppAssets.mulishFontFamily,
          color: AppColors.blackText,
          fontSize: 16,
          fontWeight: FontWeight.w600
      )
  );

}