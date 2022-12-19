import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class ButtonCustomStyle extends StatelessWidget {
  const ButtonCustomStyle({Key? key, required this.buttonText})
      : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.loginButtonSizedBoxWidth,
      height: Dimensions.loginButtonSizedBoxHeight,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Palette.loginButtonBoxShadow,
              blurRadius: Dimensions.loginButtonSizedBoxShadowBlur,
            ),
          ],
          color: Palette.loginButtonContainer,
          border: Border.all(
            width: Dimensions.loginButtonSizedBoxBorderWidth,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              Dimensions.loginButtonSizedBoxBorderRadius,
            ),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: Dimensions.loginButtonSizedBoxTextFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
