import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class TextShadowStyle extends StatelessWidget {
  const TextShadowStyle({
    Key? key,
    required this.text,
    required this.shadowColor,
    required this.fontSize,
  }) : super(key: key);
  final String text;
  final Color shadowColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          shadows: <Shadow>[
            Shadow(
              offset: const Offset(
                Dimensions.loginScreenTitleShadowOffset,
                Dimensions.loginScreenTitleShadowOffset,
              ),
              blurRadius: Dimensions.loginScreenTitleShadowBlurRadius,
              color: shadowColor,
            ),
          ],
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
