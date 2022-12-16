import 'package:flutter/material.dart';
import '../../core/util/constants_asset.dart';
import '../../core/util/constants_dimension.dart';
import '../../core/util/constants_string.dart';
import '../widget/widgets.dart';

class UsersAppBar extends StatelessWidget {
  final double scrollOfSet;

  const UsersAppBar({
    Key? key,
    required this.scrollOfSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange.withOpacity(
          (scrollOfSet / ConstantsDimension.userScreenScrollOffsetDivideValue)
              .clamp(
                ConstantsDimension.userScreenScrollOffsetClampStart,
                ConstantsDimension.userScreenScrollOffsetClampEnd,
              )
              .toDouble(),
        ),
        border: const Border(
          bottom: BorderSide(
            color: Colors.black,
            width: ConstantsDimension.usersAppBarBorderWidth,
          ),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: ConstantsDimension.userAppBarVerticalPadding,
        horizontal: ConstantsDimension.userAppBarHorizontalPadding,
      ),
      child: const Responsive(
        mobile: _UsersAppBarMobile(),
        desktop: _UsersAppBarDesktop(),
      ),
    );
  }
}

class _UsersAppBarMobile extends StatelessWidget {
  const _UsersAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: ConstantsDimension.userAppBarLogoBorderWidth,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  ConstantsDimension.userAppBarLogoBorderRadius,
                ),
              ),
            ),
            child: Image.asset(
              ConstantsAsset.fudoLogo0,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Center(
                  child: Text(
                    ConstantsString.usersAppBarTitleText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ConstantsDimension.usersAppBarTitleTextFontSize,
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

class _UsersAppBarDesktop extends StatelessWidget {
  const _UsersAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: ConstantsDimension.userAppBarLogoBorderWidth,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  ConstantsDimension.userAppBarLogoBorderRadius,
                ),
              ),
            ),
            child: Image.asset(
              ConstantsAsset.fudoLogo0,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Center(
                  child: Text(
                    ConstantsString.usersAppBarTitleText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ConstantsDimension.usersAppBarTitleTextFontSize,
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
