import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/states/create_ad/create_ad_screen_type.dart';
import 'package:pet_shelter/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter/views/components/button.dart';
import 'package:pet_shelter/views/components/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CreateAdAddPhotoWidget extends StatelessWidget {
  const CreateAdAddPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateAdState state = Provider.of<CreateAdState>(context);
    return _buildContent(context, state);
  }

  Widget _buildContent(BuildContext context, CreateAdState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomAppBar(header: AppStrings.addPhotoHeader),
        const Spacer(),
        Button(
            labelText: AppStrings.uploadPhotoButton,
            iconName: AppAssets.galleryIcon,
            onPressedCallback: () => _onAddPhoto(context, state)
        ),
        Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Button(
                labelText: AppStrings.takePhotoButton,
                iconName: AppAssets.photoIcon,
                onPressedCallback: () => {}
            ),
        ),
        const Spacer(),
      ],
    );
  }

  void _onAddPhoto(BuildContext context, CreateAdState state) async {
    state.selectScreen(CreateAdScreenType.reviewPhoto);
    XFile? image = await GetIt.instance.get<ImagePicker>().pickImage(source: ImageSource.gallery);
    if (image != null) {
      state.savePhoto(File(image.path));
      state.selectScreen(CreateAdScreenType.reviewPhoto);
    }
  }
}
