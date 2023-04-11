import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_shelter/repository/local_storage.dart';
import 'package:pet_shelter/services/basic_network_service.dart';
import 'package:pet_shelter/states/create_ad/create_ad_screen_type.dart';
import 'package:pet_shelter/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter/views/create_ad/create_ad_description_widget.dart';
import 'package:pet_shelter/views/create_ad/create_ad_review_photo_widget.dart';
import 'package:pet_shelter/views/create_ad/create_ad_add_photo_widget.dart';
import 'package:pet_shelter/views/create_ad/create_ad_specify_address_widget.dart';
import 'package:provider/provider.dart';

class CreateAdContainerWidget extends StatelessWidget {
  const CreateAdContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateAdState>(
        create: (_) => CreateAdState(
          networkService: GetIt.instance.get<BasicNetworkService>(),
          localStorage: GetIt.instance.get<LocalStorage>()
        ),
        child: Consumer<CreateAdState>(
            builder: (context, state, child) => Scaffold(
              body: _buildContent(state),
            ),
        )
    );
  }

  Widget _buildContent(CreateAdState state) {
    switch (state.selectedScreen) {
      case CreateAdScreenType.addPhoto:
        return const CreateAdAddPhotoWidget();
      case CreateAdScreenType.reviewPhoto:
        return const CreateAdReviewPhotoWidget();
      case CreateAdScreenType.specifyAddress:
        return const CreateAdSpecifyAddressWidget();
      case CreateAdScreenType.addDescription:
        return const CreateAdDescriptionWidget();
      default:
        return const CreateAdAddPhotoWidget();
    }
  }
}
