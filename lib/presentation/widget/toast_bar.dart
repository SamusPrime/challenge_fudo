import 'package:flutter/material.dart';

import '../../core/util/dimensions.dart';

class ToastBar extends StatelessWidget {
  final String detailMessage;

  const ToastBar({
    Key? key,
    required this.detailMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      detailMessage,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: Dimensions.toastBarTextFontSize,
      ),
    );
  }
}
