import 'package:flutter/material.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/models/geo_coordinate.dart';
import 'package:pet_shelter/states/create_ad/create_ad_screen_type.dart';
import 'package:pet_shelter/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter/views/components/button.dart';
import 'package:pet_shelter/views/components/custom_app_bar.dart';
import 'package:pet_shelter/views/components/map_widget.dart';
import 'package:provider/provider.dart';

class CreateAdSpecifyAddressWidget extends StatelessWidget {
  const CreateAdSpecifyAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateAdState state = Provider.of<CreateAdState>(context);
    return Column(
      children: [
        CustomAppBar(
            header: AppStrings.specifyAddressButton,
            onBack: () => state.selectScreen(CreateAdScreenType.reviewPhoto)
        ),
        Expanded(child: _buildContent(context, state))
      ],
    );
  }

  Widget _buildContent(BuildContext context, CreateAdState state) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        _buildMap(),
        Padding(
          padding: EdgeInsets.only(top: 16, bottom: 24),
          child: Column(
            children: [
              const Spacer(),
              Button(
                  labelText: AppStrings.specifyAddressButton,
                  onPressedCallback: () {
                    state.saveGeoCoordinate(GeoCoordinate(55, 73));
                    state.selectScreen(CreateAdScreenType.addDescription);
                  }
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMap() {
    // return SimpleOSM();
    // TODO: add Map
    return const SizedBox.shrink();
  }
}
