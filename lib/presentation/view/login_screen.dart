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
        backgroundColor: ConstantsPalette.loginScreenBackground,
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                left: ConstantsDimension.loginScreenTitlePaddingLeft,
                right: ConstantsDimension.loginScreenTitlePaddingRight,
                bottom: ConstantsDimension.loginScreenTitlePaddingBottom,
                top: ConstantsDimension.loginScreenTitlePaddingTop,
              ),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset(
                          ConstantsAsset.fudoLogo0,
                          width: ConstantsDimension.loginScreenLogoWidth,
                          height: ConstantsDimension.loginScreenLogoHeight,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(
                        child: Text(
                          ConstantsString.loginScreenTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(
                                  ConstantsDimension
                                      .loginScreenTitleShadowOffset,
                                  ConstantsDimension
                                      .loginScreenTitleShadowOffset,
                                ),
                                blurRadius: ConstantsDimension
                                    .loginScreenTitleShadowBlurRadius,
                                color: ConstantsPalette.loginScreenTitleShadow,
                              ),
                            ],
                            fontWeight: FontWeight.w600,
                            fontSize:
                                ConstantsDimension.loginScreenTitleFontSize,
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
                left: ConstantsDimension.loginScreenSliverPaddingDefault,
                right: ConstantsDimension.loginScreenSliverPaddingDefault,
                bottom: ConstantsDimension.loginScreenSliverPaddingBottom,
                top: ConstantsDimension.loginScreenSliverPaddingDefault,
              ),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: ConstantsDimension.loginScreenTextFieldWidth,
                  height: ConstantsDimension.loginScreenTextFieldHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: ConstantsPalette.loginScreenTextFieldBoxShadow,
                          blurRadius: ConstantsDimension
                              .loginScreenTextFieldShadowBlurRadius,
                        ),
                      ],
                      color: ConstantsPalette.loginScreenTextFieldContainer,
                      border: Border.all(
                        width:
                            ConstantsDimension.loginScreenTextFieldBorderWidth,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          ConstantsDimension.loginScreenTextFieldBorderRadius,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left:
                            ConstantsDimension.loginScreenTextFieldPaddingLeft,
                      ),
                      child: LoginTextField(
                        hintText: ConstantsString.loginScreenHintUser,
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
                left: ConstantsDimension.loginScreenSliverPaddingDefault,
                bottom: ConstantsDimension.loginScreenSliverPaddingDefault,
                right: ConstantsDimension.loginScreenSliverPaddingDefault,
              ),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: ConstantsDimension.loginScreenTextFieldWidth,
                  height: ConstantsDimension.loginScreenTextFieldHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: ConstantsPalette.loginScreenTextFieldBoxShadow,
                          blurRadius: ConstantsDimension
                              .loginScreenTextFieldShadowBlurRadius,
                        ),
                      ],
                      color: ConstantsPalette.loginScreenTextFieldContainer,
                      border: Border.all(
                        width:
                            ConstantsDimension.loginScreenTextFieldBorderWidth,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          ConstantsDimension.loginScreenTextFieldBorderRadius,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left:
                            ConstantsDimension.loginScreenTextFieldPaddingLeft,
                      ),
                      child: LoginTextField(
                        textController: passwordController,
                        hintText: ConstantsString.loginScreenHintPassword,
                        obscureText: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: ConstantsDimension.loginScreenLoginButtonPaddingLeft,
                right: ConstantsDimension.loginScreenLoginButtonPaddingRight,
                top: ConstantsDimension.loginScreenLoginButtonPaddingTop,
                bottom: ConstantsDimension.loginScreenLoginButtonPaddingBottom,
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
                  ConstantsString.loginScreenRegister,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
