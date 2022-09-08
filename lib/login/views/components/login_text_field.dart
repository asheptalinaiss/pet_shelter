import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_types.dart';
import 'package:pet_shelter/login/ui_constants/login_style.dart';

class LoginFormField extends StatefulWidget {
  final String labelText;
  final StringCallback onChanged;
  final ValidatorCallback? validator;
  final bool obscureText;

  const LoginFormField(this.labelText, this.onChanged, this.obscureText, this.validator, {Key? key})
      : super(key: key);

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 2
        )
      ]),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: widget.labelText,
            labelStyle: const TextStyle(
              fontFamily: AppAssets.mulishFontFamily,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.hintText,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.error)
            ),
            errorStyle: LoginStyle.errorTextStyle,
            suffixIcon: widget.obscureText ? IconButton(
              icon: SvgPicture.asset(AppAssets.hidePasswordIcon),
              onPressed: () {
                _toggleObscure();
              },
            ) : const SizedBox.shrink()
        ),
        obscureText: widget.obscureText && _obscure,
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }

  void _toggleObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }
}