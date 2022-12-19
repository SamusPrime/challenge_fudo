import 'package:flutter/material.dart';
import '../../core/util/constants.dart';

class VisibilityText extends StatelessWidget {
  const VisibilityText({
    required this.objectAttribute,
    required this.isVisible,
    super.key,
    this.fontSize = Dimensions.visibilityTextFontSize,
  });

  final String objectAttribute;
  final bool isVisible;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width *
            Dimensions.visibilityTextBoxConstraintsMaxWidth,
      ),
      child: Visibility(
        visible: isVisible,
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.visibilityTextPadding,
          ),
          child: Center(
            child: Text(
              objectAttribute,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
