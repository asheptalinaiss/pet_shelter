import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/add_ad/views/add_ad.dart';
import 'package:pet_shelter/feed/views/feed.dart';
import 'package:pet_shelter/profile/views/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const Feed();
      case 1:
        return const AddAd();
      case 2:
        return const Profile();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.adsIconUnelected, width: 40),
          activeIcon: SvgPicture.asset(AppAssets.adsIconSelected, width: 40),
          label: AppStrings.adsButton,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.addAdIconUnselected, width: 40),
          activeIcon: SvgPicture.asset(AppAssets.addAdIconSelected, width: 40),
          label: AppStrings.addAdButton,
        ),
        BottomNavigationBarItem(
          icon:  SvgPicture.asset(AppAssets.profileIconUnselected, width: 40),
          activeIcon:  SvgPicture.asset(AppAssets.profileIconSelected, width: 40),
          label: AppStrings.profileButton,
        )
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      backgroundColor: AppColors.primary,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        fontFamily: AppAssets.mulishFontFamily,
        fontWeight: FontWeight.w800,
        fontSize: 12,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: AppAssets.mulishFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    );
  }
}
