import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_strings.dart';
import 'package:pet_shelter/login/models/sign_in_model.dart';
import 'package:pet_shelter/login/models/sign_up_model.dart';
import 'package:pet_shelter/login/ui_constants/login_style.dart';
import 'package:pet_shelter/login/ui_constants/login_ui_constants.dart';
import 'package:pet_shelter/login/views/components/login_later_button.dart';
import 'package:pet_shelter/login/views/sign_in_form.dart';
import 'package:pet_shelter/login/views/sign_up_form.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
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
      body: Container(
        padding: EdgeInsets.symmetric(
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
              LoginLaterButton(() { })
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
              create: (_) => SignInModel(),
              child: _buildSignInView(screenWidth),
            ),
            ChangeNotifierProvider(
              create: (_) => SignUpModel(),
              child: _buildSignUpView(screenWidth)
            )
          ],
        )
    );
  }

  Widget _buildSignInView(double screenWidth) {
    return Column(
      children: [
        Consumer<SignInModel>(
            builder: (_, signInModel, child) {
              return SignInForm(
                  signInModel,
                  screenWidth * LoginUIConstants.formInnerPaddingCoeff
              );
            }
        ),
        SizedBox(height: screenWidth * LoginUIConstants.formOuterPaddingCoeff),
        _forgotPasswordButton()
      ],
    );
  }

  Widget _buildSignUpView(double screenWidth) {
    return Consumer<SignUpModel>(
        builder: (_, signUpModel, child) {
          return SignUpForm(
              signUpModel,
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
