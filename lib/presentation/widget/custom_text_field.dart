import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final bool obscureText;
  final double boxHeight;
  final double boxWidth;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.obscureText,
    this.boxHeight = Dimensions.loginScreenTextFieldHeight,
    this.boxWidth = Dimensions.loginScreenTextFieldWidth,
    this.maxLines = Dimensions.postCreationScreenTextFieldBodyMaxLinesDefault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Palette.loginScreenTextFieldBoxShadow,
              blurRadius: Dimensions.loginScreenTextFieldShadowBlurRadius,
            ),
          ],
          color: Palette.loginScreenTextFieldContainer,
          border: Border.all(
            width: Dimensions.loginScreenTextFieldBorderWidth,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              Dimensions.loginScreenTextFieldBorderRadius,
            ),
          ),
        ),
        child: SizedBox(
          width: Dimensions.loginScreenTextFieldWidth,
          height: Dimensions.loginScreenTextFieldHeight,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Palette.loginScreenTextFieldBoxShadow,
                  blurRadius: Dimensions.loginScreenTextFieldShadowBlurRadius,
                ),
              ],
              color: Palette.loginScreenTextFieldContainer,
              border: Border.all(
                width: Dimensions.loginScreenTextFieldBorderWidth,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  Dimensions.loginScreenTextFieldBorderRadius,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.loginScreenTextFieldPaddingLeft,
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: maxLines,
                controller: textController,
                textAlign: TextAlign.start,
                obscureText: obscureText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Palette.loginTextFieldBorderSide,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
