import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';
import 'package:pet_shelter/constants/app_types.dart';
import 'package:pet_shelter/main/global_styles.dart';

class LoginFormField extends StatefulWidget {
  final String? value;
  final String labelText;
  final StringCallback onChanged;
  final bool obscureText;
  final String? errorText;

  const LoginFormField(this.value, this.labelText, this.onChanged, this.obscureText, this.errorText, {Key? key})
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
        initialValue: widget.value,
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
                borderSide: widget.errorText == null
                    ? BorderSide.none
                    : const BorderSide(color: AppColors.error, width: 2)
            ),
            errorText: widget.errorText,
            errorStyle: GlobalStyles.errorTextStyle,
            suffixIcon: widget.obscureText ? IconButton(
              icon: SvgPicture.asset(AppAssets.hidePasswordIcon),
              onPressed: () {
                _toggleObscure();
              },
            ) : const SizedBox.shrink()
        ),
        obscureText: widget.obscureText && _obscure,
        onChanged: widget.onChanged,
      ),
    );
  }

  void _toggleObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }
}