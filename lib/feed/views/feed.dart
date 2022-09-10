import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/feed/states/feed_state.dart';
import 'package:pet_shelter/feed/ui_constants/feed_ui_constants.dart';
import 'package:pet_shelter/feed/views/feed_item.dart';
import 'package:pet_shelter/login/ui_constants/login_ui_constants.dart';
import 'package:pet_shelter/services/basic_network_service.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildTabBar(),
            ],
          ),
        ),
        body: _buildTabBarView(screenWidth),
      ),
    );
  }

  Widget _buildTabBar() {
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

  Widget _buildTabBarView(double screenWidth) {
    return ChangeNotifierProvider(
      create: (_) => FeedState(GetIt.instance.get<BasicNetworkService>()),
      child: TabBarView(
        children: [
          _buildGrid(screenWidth),
          // Icon(Icons.flight, size: 350),
          Icon(Icons.directions_transit, size: 350),
          Icon(Icons.directions_car, size: 350),
          Icon(Icons.directions_car, size: 350),
        ],
      ),
    );
  }

  Widget _buildGrid(double screenWidth) {
    double gridItemWidth = (screenWidth - FeedUIConstants.gridSpacing
        - screenWidth * FeedUIConstants.gridHorizontalPaddingCoeff * 2) / 2;
    double gridItemHeight = gridItemWidth * 1.68;

    return Consumer<FeedState>(
        builder: (_, feedState, child) {
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
                      child: FeedItem(
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
    );
  }

  List<Container> _buildGridTileList(int count) => List.generate(
      count, (i) => Container(child: Text('images/pic$i.jpg')));
}