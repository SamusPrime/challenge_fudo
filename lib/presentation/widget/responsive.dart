import 'package:flutter/material.dart';

import '../../core/util/constants_dimension.dart';

class Responsive extends StatelessWidget {
  final Widget? tablet;
  final Widget mobile;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
    this.tablet,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <
      ConstantsDimension.responsiveMobileWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >=
          ConstantsDimension.responsiveMobileWidth &&
      MediaQuery.of(context).size.width <
          ConstantsDimension.responsiveDesktopWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >=
      ConstantsDimension.responsiveDesktopWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ConstantsDimension.responsiveDesktopWidth) {
          return desktop;
        } else if (constraints.maxWidth >=
            ConstantsDimension.responsiveMobileWidth) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
