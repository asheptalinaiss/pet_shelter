import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/states/feed/feed_state.dart';
import 'package:pet_shelter/ui_constants/feed_ui_constants.dart';
import 'package:pet_shelter/views/feed/feed_item_widget.dart';
import 'package:pet_shelter/ui_constants/global_styles.dart';
import 'package:pet_shelter/models/pet_type.dart';
import 'package:pet_shelter/services/basic_network_service.dart';
import 'package:provider/provider.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => FeedState(GetIt.instance.get<BasicNetworkService>()),
      child: Consumer<FeedState>(
          builder: (_, feedState, child) {
            return DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.primary,
                  flexibleSpace: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildTabBar(feedState),
                    ],
                  ),
                ),
                body: _buildTabBarView(feedState, screenWidth),
              ),
            );
          }
      ) ,
    );
  }

  Widget _buildTabBar(FeedState feedState) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.white,
                  width: FeedUIConstants.inactiveIndicatorHeight
              )
          )
      ),
      child: TabBar(
        onTap: (index) {
          final PetType? petType;
          switch(index) {
            case 1:
              petType = PetType.dog;
              break;
            case 2:
              petType = PetType.cat;
              break;
            case 3:
              petType = PetType.other;
              break;
            default:
              petType = null;
              break;
          }
          feedState.onPetTypeChanged(petType);
        },
        tabs: const [
          Tab(text: AppStrings.allTab),
          Tab(text: AppStrings.dogsTab),
          Tab(text: AppStrings.catsTab),
          Tab(text: AppStrings.otherTab),
        ],
        labelStyle: const TextStyle(
            fontFamily: AppAssets.mulishFontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
        unselectedLabelColor: Colors.white,
        indicator: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.white,
                  width: FeedUIConstants.activeIndicatorHeight
              )
          ),
        ),
      )
    );
  }

  Widget _buildTabBarView(FeedState feedState, double screenWidth) {
    return TabBarView(
      children: [
        _buildBody(feedState, screenWidth),
        _buildBody(feedState, screenWidth),
        _buildBody(feedState, screenWidth),
        _buildBody(feedState, screenWidth)
      ],
    );
  }

  Widget _buildBody(FeedState feedState, double screenWidth) {
    if (feedState.feedError != null) {
      return Center(
        child: Text(feedState.feedError!, style: GlobalStyles.errorTextStyle,),
      );
    } else {
      return _buildGrid(feedState, screenWidth);
    }
  }

  Widget _buildGrid(FeedState feedState, double screenWidth) {
    double gridItemWidth = (screenWidth - FeedUIConstants.gridSpacing
        - screenWidth * FeedUIConstants.gridHorizontalPaddingCoeff * 2) / 2;
    double gridItemHeight = gridItemWidth * 1.68;

    return GridView.extent(
        maxCrossAxisExtent: gridItemWidth,
        childAspectRatio: gridItemWidth / gridItemHeight,
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * FeedUIConstants.gridVerticalPaddingCoeff,
            horizontal: screenWidth * FeedUIConstants.gridHorizontalPaddingCoeff
        ),
        mainAxisSpacing: FeedUIConstants.gridSpacing,
        crossAxisSpacing: FeedUIConstants.gridSpacing,
        children: feedState.announcements
            .map((ad) => SizedBox(
            width: gridItemWidth,
            height: gridItemHeight,
            child: FeedItemWidget(
              imageUrl: ad.imageUrl,
              title: ad.title,
              description: ad.description,
              address: "Address", // TODO: convert geoPosition to address
              width: gridItemWidth,
            )
        ))
            .toList()
    );
  }

  List<Container> _buildGridTileList(int count) => List.generate(
      count, (i) => Container(child: Text('images/pic$i.jpg')));
}