import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_shelter/add_ad/views/add_ad_addess.dart';
import 'package:pet_shelter/add_ad/views/add_ad_photo.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/main/global_styles.dart';
import 'package:pet_shelter/main/global_ui_constants.dart';

class AddAd extends StatelessWidget {
  const AddAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.uploadPhotoHeader),
        backgroundColor: AppColors.primary,
        titleTextStyle: GlobalStyles.headerTitleTextStyle,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AddAdAddress())
                );
                // _onAddPhoto(context);
              },
              style: GlobalStyles.elevatedButtonStyle,
              child: Wrap(
                spacing: GlobalUIConstants.buttonInnerPadding,
                children: [
                  SvgPicture.asset(AppAssets.addPhotoIcon),
                  const Text(AppStrings.addPhotoButton)
                ],
              )
          ),
        ),
      ),
    );
  }

  void _onAddPhoto(BuildContext context) async {
    // XFile image = await imagePicker.pickImage(
    //     source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
    // setState(() {
    //   _image = File(image.path);
    // });
    XFile? image = await GetIt.instance.get<ImagePicker>().pickImage(source: ImageSource.gallery);
    if (image != null) {
      Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddAdPhoto(photoFile: File(image.path))));
    }
  }
}
