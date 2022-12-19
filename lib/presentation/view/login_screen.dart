import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/util/constants.dart';
import '../widget/text_shadow_style.dart';
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
                    const  Center(
                        child:   SizedBox(
                          child: TextShadowStyle(
                            text: Strings.loginScreenTitle,
                            shadowColor: Palette.loginScreenTitleShadow,
                            fontSize: Dimensions.loginScreenTitleFontSize,
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
                child: CustomTextField(
                  hintText: Strings.loginScreenHintUser,
                  obscureText: false,
                  textController: userController,
                  boxHeight: Dimensions.loginScreenTextFieldHeight,
                  boxWidth: Dimensions.loginScreenTextFieldWidth,
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
                child: CustomTextField(
                  textController: passwordController,
                  hintText: Strings.loginScreenHintPassword,
                  obscureText: true,
                  boxHeight: Dimensions.loginScreenTextFieldHeight,
                  boxWidth: Dimensions.loginScreenTextFieldWidth,
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
            SliverToBoxAdapter(
              child: Center(
                child: InkWell(
                  onTap: () => launchUrl(
                    Strings.loginScreenRegisterLink,
                  ),
                  child: const Text(
                    Strings.loginScreenRegister,
                    style: TextStyle(
                      color: Palette.loginScreenRegisterText,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
