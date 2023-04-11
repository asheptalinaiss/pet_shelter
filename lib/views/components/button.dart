import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter/ui_constants/global_styles.dart';
import 'package:pet_shelter/ui_constants/global_ui_constants.dart';

class Button extends StatelessWidget {
  final String labelText;
  final String? iconName;
  final VoidCallback onPressedCallback;

  const Button({required this.labelText, this.iconName, required this.onPressedCallback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedCallback,
      style: GlobalStyles.elevatedButtonStyle,
      child: iconName == null ? Text(labelText) : Wrap(
        spacing: GlobalUIConstants.buttonInnerPadding,
        children: [
          SvgPicture.asset(iconName!, color: Colors.white),
          Text(labelText)
        ],
      ),
    );
  }
}
