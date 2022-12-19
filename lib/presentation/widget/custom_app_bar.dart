import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class CustomAppBar extends StatefulWidget {
  final String titleText;

  const CustomAppBar({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.customAppBarBoxColor,
        border: const Border(
          bottom: BorderSide(
            width: Dimensions.customAppBarBorderWidth,
          ),
        ),
      ),
      width: Dimensions.customAppBarWidth,
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.customAppBarVerticalPadding,
        horizontal: Dimensions.customAppBarHorizontalPadding,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: Dimensions.customAppBarLogoBorderWidth,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  Dimensions.customAppBarLogoBorderRadius,
                ),
              ),
            ),
            child: Image.asset(
              Assets.fudoLogo0,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    widget.titleText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Dimensions.customAppBarTitleTextFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
