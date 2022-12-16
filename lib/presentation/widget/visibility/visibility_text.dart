import 'package:flutter/material.dart';

import '../../../core/util/constants.dart';

class VisibilityText extends StatelessWidget {
  const VisibilityText({
    required this.userAttribute,
    required this.isVisible,
    super.key,
  });

  final String userAttribute;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width *
            ConstantsDimension.visibilityTextBoxConstraintsMaxWidth,
      ),
      child: Visibility(
        visible: isVisible,
        child: Padding(
          padding: const EdgeInsets.all(
            ConstantsDimension.visibilityTextPadding,
          ),
          child: Text(
            userAttribute,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ConstantsDimension.visibilityTextFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
