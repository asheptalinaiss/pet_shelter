import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/main/global_styles.dart';

class AddAdPhoto extends StatelessWidget {

  final File photoFile;

  const AddAdPhoto({super.key, required this.photoFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.uploadPhotoHeader),
        backgroundColor: AppColors.primary,
        titleTextStyle: GlobalStyles.headerTitleTextStyle,
      ),
      body: Column(
        children: [
          Image.file(photoFile)
        ],
      ),
    );
  }
}
