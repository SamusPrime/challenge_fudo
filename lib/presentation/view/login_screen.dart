import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../widget/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.loginScreenBackground,
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                left: Dimensions.loginScreenTitlePaddingLeft,
                right: Dimensions.loginScreenTitlePaddingRight,
                bottom: Dimensions.loginScreenTitlePaddingBottom,
                top: Dimensions.loginScreenTitlePaddingTop,
              ),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset(
                          Assets.fudoLogo0,
                          width: Dimensions.loginScreenLogoWidth,
                          height: Dimensions.loginScreenLogoHeight,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(
                        child: Text(
                          Strings.loginScreenTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(
                                  Dimensions
                                      .loginScreenTitleShadowOffset,
                                  Dimensions
                                      .loginScreenTitleShadowOffset,
                                ),
                                blurRadius: Dimensions
                                    .loginScreenTitleShadowBlurRadius,
                                color: Palette.loginScreenTitleShadow,
                              ),
                            ],
                            fontWeight: FontWeight.w600,
                            fontSize:
                                Dimensions.loginScreenTitleFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: Dimensions.loginScreenSliverPaddingDefault,
                right: Dimensions.loginScreenSliverPaddingDefault,
                bottom: Dimensions.loginScreenSliverPaddingBottom,
                top: Dimensions.loginScreenSliverPaddingDefault,
              ),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: Dimensions.loginScreenTextFieldWidth,
                  height: Dimensions.loginScreenTextFieldHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Palette.loginScreenTextFieldBoxShadow,
                          blurRadius: Dimensions
                              .loginScreenTextFieldShadowBlurRadius,
                        ),
                      ],
                      color: Palette.loginScreenTextFieldContainer,
                      border: Border.all(
                        width:
                            Dimensions.loginScreenTextFieldBorderWidth,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          Dimensions.loginScreenTextFieldBorderRadius,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left:
                            Dimensions.loginScreenTextFieldPaddingLeft,
                      ),
                      child: LoginTextField(
                        hintText: Strings.loginScreenHintUser,
                        obscureText: false,
                        textController: userController,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: Dimensions.loginScreenSliverPaddingDefault,
                bottom: Dimensions.loginScreenSliverPaddingDefault,
                right: Dimensions.loginScreenSliverPaddingDefault,
              ),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: Dimensions.loginScreenTextFieldWidth,
                  height: Dimensions.loginScreenTextFieldHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Palette.loginScreenTextFieldBoxShadow,
                          blurRadius: Dimensions
                              .loginScreenTextFieldShadowBlurRadius,
                        ),
                      ],
                      color: Palette.loginScreenTextFieldContainer,
                      border: Border.all(
                        width:
                            Dimensions.loginScreenTextFieldBorderWidth,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          Dimensions.loginScreenTextFieldBorderRadius,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left:
                            Dimensions.loginScreenTextFieldPaddingLeft,
                      ),
                      child: LoginTextField(
                        textController: passwordController,
                        hintText: Strings.loginScreenHintPassword,
                        obscureText: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: Dimensions.loginScreenLoginButtonPaddingLeft,
                right: Dimensions.loginScreenLoginButtonPaddingRight,
                top: Dimensions.loginScreenLoginButtonPaddingTop,
                bottom: Dimensions.loginScreenLoginButtonPaddingBottom,
              ),
              sliver: SliverToBoxAdapter(
                child: LoginButton(
                  userInputController: userController,
                  passwordInputController: passwordController,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  Strings.loginScreenRegister,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
