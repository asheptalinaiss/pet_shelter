import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/models/pet_type.dart';
import 'package:pet_shelter/states/create_ad/create_ad_screen_type.dart';
import 'package:pet_shelter/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter/ui_constants/global_ui_constants.dart';
import 'package:pet_shelter/views/components/button.dart';
import 'package:pet_shelter/views/components/custom_app_bar.dart';
import 'package:pet_shelter/views/components/custom_form_field.dart';
import 'package:provider/provider.dart';

class CreateAdDescriptionWidget extends StatelessWidget {
  const CreateAdDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateAdState state = Provider.of<CreateAdState>(context);
    return Column(
        children: [
          CustomAppBar(
              header: AppStrings.specifyAddressButton,
              onBack: () => state.selectScreen(CreateAdScreenType.specifyAddress)
          ),
          Expanded(child: _buildContent(context, state))
        ]
    );
  }

  Widget _buildContent(BuildContext context, CreateAdState state) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: screenSize.width * GlobalUIConstants.horizontalPaddingCoff,
        right: screenSize.width * GlobalUIConstants.horizontalPaddingCoff,
        bottom: screenSize.height * GlobalUIConstants.bottomButtonPaddingCoff
      ),
      child: Column(
        children: [
          _buildPetTypeSelectors(state, screenSize),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: _buildTitleTextField(state)
          ),
          Expanded(child: _buildDescriptionTextField(state)),
          const Spacer(),
          _buildCreateButton(state)
        ],
      ),
    );
  }

  Widget _buildTitleTextField(CreateAdState state) {
    return CustomFormField(
      labelText: AppStrings.adTitleHint,
      onChanged: (value) => state.onTitleChanged(value),
      errorText: state.titleError,
    );
  }

  Widget _buildDescriptionTextField(CreateAdState state) {
    return CustomFormField(
      labelText: AppStrings.petDescriptionHint,
      onChanged: (value) => state.onDescriptionChanged(value),
      errorText: state.descriptionError,
      maxLines: 10,
    );
  }

  Widget _buildCreateButton(CreateAdState state) {
    return Button(labelText: AppStrings.createAdButton, onPressedCallback: () => state.createAd());
  }

  Widget _buildPetTypeSelectors(CreateAdState state, Size screenSize) {
    return GridView.builder(
      shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: PetType.values.length,
          crossAxisSpacing: 12
        ),
        itemCount: PetType.values.length,
        itemBuilder: (context, index) =>
          GestureDetector(
            onTap: () => state.selectPetType(PetType.values[index]),
            child: _buildPetTypeItem(
              PetType.values[index],
              state.petType == PetType.values[index],
              screenSize
            ),
          )
    );
  }

  Widget _buildPetTypeItem(PetType petType, bool selected, Size screenSize) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? AppColors.accent : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, spreadRadius: 2)]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            petType.getIconName(),
            color: selected ? Colors.white : AppColors.primary,
            width: screenSize.width * 0.16
          ),
          Text(petType.getDisplayName(), style: TextStyle(
              fontFamily: AppAssets.mulishFontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : AppColors.primary
          ))
        ],
      ),
    );
  }
}
