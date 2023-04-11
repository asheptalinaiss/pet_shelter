import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/states/auth/sign_in_state.dart';
import 'package:pet_shelter/states/auth/sign_up_state.dart';
import 'package:pet_shelter/ui_constants/login_style.dart';
import 'package:pet_shelter/ui_constants/login_ui_constants.dart';
import 'package:pet_shelter/views/auth/components/login_later_button.dart';
import 'package:pet_shelter/views/auth/sign_in_form.dart';
import 'package:pet_shelter/views/auth/sign_up_form.dart';
import 'package:pet_shelter/views/main_screen_widget.dart';
import 'package:pet_shelter/repository/local_storage.dart';
import 'package:pet_shelter/services/basic_network_service.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: screenWidth * LoginUIConstants.verticalPaddingCoeff,
          horizontal: screenWidth * LoginUIConstants.horizontalPaddingCoeff
        ),
        child: Column(
            children: [
              _buildLogoView(screenWidth * LoginUIConstants.logoWithCoeff),
              SizedBox(height: screenWidth * LoginUIConstants.logoBottomPaddingCoeff),
              _buildTabBar(screenWidth),
              SizedBox(height: screenWidth * LoginUIConstants.formOuterPaddingCoeff),
              _buildTabView(screenWidth),
              LoginLaterButton(() {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const MainScreenWidget()));
              })
            ]
        )
      )
    );
  }

  Widget _buildLogoView(double width) {
    return SvgPicture.asset(AppAssets.appLogo, width: width);
  }

  Widget _buildTabBar(double screenWidth) {
    return Container(
      height: screenWidth * LoginUIConstants.tabBarHeightCoeff,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.primary,
                  width: LoginUIConstants.inactiveIndicatorHeight
              )
          )
      ),
      child: TabBar(
        controller: _tabController,
        indicator: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.primary,
                  width: LoginUIConstants.activeIndicatorHeight
              )
          ),
        ),
        labelColor: AppColors.blackText,
        unselectedLabelColor: AppColors.blackText,
        labelStyle: const TextStyle(
            fontFamily: AppAssets.mulishFontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.blackText
        ),
        tabs: const [
          Tab(text: AppStrings.signInTab),
          Tab(text: AppStrings.signUpTab),
        ],
      ),
    );
  }

  Widget _buildTabView(double screenWidth) {
    return Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            ChangeNotifierProvider(
              create: (_) => SignInState(
                GetIt.instance.get<BasicNetworkService>(),
                GetIt.instance.get<LocalStorage>()
              ),
              child: _buildSignInView(screenWidth),
            ),
            ChangeNotifierProvider(
              create: (_) => SignUpState(
                GetIt.instance.get<BasicNetworkService>(),
                GetIt.instance.get<LocalStorage>()
              ),
              child: _buildSignUpView(screenWidth)
            )
          ],
        )
    );
  }

  Widget _buildSignInView(double screenWidth) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Consumer<SignInState>(
                builder: (_, signInState, child) {
                  return SignInForm(
                      signInState,
                      screenWidth * LoginUIConstants.formInnerPaddingCoeff
                  );
                }
            ),
            SizedBox(height: screenWidth * LoginUIConstants.formOuterPaddingCoeff),
            _forgotPasswordButton()
          ],
        )
    );
  }

  Widget _buildSignUpView(double screenWidth) {
    return Consumer<SignUpState>(
        builder: (_, signUpState, child) {
          return SignUpForm(
              signUpState,
              screenWidth * LoginUIConstants.formInnerPaddingCoeff
          );
        }
    );
  }

  Widget _forgotPasswordButton() {
    return TextButton(
        onPressed: () {},
        style: LoginStyle.textButtonStyle,
        child: const Text(AppStrings.forgotPassword)
    );
  }
}
