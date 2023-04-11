import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';

class GlobalStyles {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
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
  );

  static TextStyle headerTitleTextStyle = const TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

  static TextStyle errorTextStyle = const TextStyle(
      fontFamily: AppAssets.mulishFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.error
  );
}
