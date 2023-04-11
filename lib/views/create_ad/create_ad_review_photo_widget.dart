import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/states/create_ad/create_ad_screen_type.dart';
import 'package:pet_shelter/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter/ui_constants/global_ui_constants.dart';
import 'package:pet_shelter/views/components/button.dart';
import 'package:pet_shelter/views/components/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CreateAdReviewPhotoWidget extends StatelessWidget {
  const CreateAdReviewPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    CreateAdState state = Provider.of<CreateAdState>(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, screenSize.height * GlobalUIConstants.bottomButtonPaddingCoff),
      child: Column(
        children: [
          CustomAppBar(
              header: AppStrings.addPhotoHeader,
              onBack: () => state.selectScreen(CreateAdScreenType.addPhoto)
          ),
          _buildPhoto(state.photo),
          const Spacer(),
          Button(
              labelText: AppStrings.specifyAddressButton,
              onPressedCallback: () => state.selectScreen(CreateAdScreenType.specifyAddress)
          )
        ],
      ),
    );
  }

  Widget _buildPhoto(File? photoFile) {
    return AspectRatio(
      aspectRatio: 1,
      child: photoFile == null ? SvgPicture.asset(AppAssets.placeholderImage) : Image.file(photoFile, fit: BoxFit.cover),
    );
  }
}
