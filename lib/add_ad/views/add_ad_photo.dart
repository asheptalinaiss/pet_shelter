import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_shelter/add_ad/views/add_ad_addess.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/main/global_styles.dart';
import 'package:pet_shelter/main/global_ui_constants.dart';

class AddAdPhoto extends StatelessWidget {

  final File photoFile;

  const AddAdPhoto({super.key, required this.photoFile});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.uploadPhotoHeader),
        backgroundColor: AppColors.primary,
        titleTextStyle: GlobalStyles.headerTitleTextStyle,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, screenWidth * GlobalUIConstants.bottomButtonPaddingCoeff),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.file(photoFile),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AddAdAddress())
                  );
                },
                style: GlobalStyles.elevatedButtonStyle,
                child: Wrap(
                  spacing: GlobalUIConstants.buttonInnerPadding,
                  children: const [
                    Text(AppStrings.addAddressButton),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 16,
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
