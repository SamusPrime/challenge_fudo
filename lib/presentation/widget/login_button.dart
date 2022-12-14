import 'package:flutter/material.dart';
import '../../core/util/constants_palette.dart';
import '../../presentation/widget/widgets.dart';
import '../../core/util/constants_dimension.dart';
import '../../core/util/constants_string.dart';
import '../view/screen.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController userInputController;
  final TextEditingController passwordInputController;

  const LoginButton({
    Key? key,
    required this.userInputController,
    required this.passwordInputController,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _validateInputs(
        widget.userInputController,
        widget.passwordInputController,
      ),
      child: SizedBox(
        width: ConstantsDimension.loginButtonSizedBoxWidth,
        height: ConstantsDimension.loginButtonSizedBoxHeight,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: ConstantsPalette.loginButtonBoxShadow,
                blurRadius: ConstantsDimension.loginButtonSizedBoxShadowBlur,
              ),
            ],
            color: ConstantsPalette.loginButtonContainer,
            border: Border.all(
              width: ConstantsDimension.loginButtonSizedBoxBorderWidth,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                ConstantsDimension.loginButtonSizedBoxBorderRadius,
              ),
            ),
          ),
          child: const Center(
            child: Text(
              ConstantsString.loginButtonText,
              style: TextStyle(
                fontSize: ConstantsDimension.loginButtonSizedBoxTextFontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _validateInputs(
    TextEditingController userInputController,
    TextEditingController passwordInputController,
  ) {
    String userInput;
    String passwordInput;
    bool isAuthenticated = false;
    setState(
      () {
        userInput = userInputController.text;
        passwordInput = passwordInputController.text;

        if (userInput == ConstantsString.loginButtonCorrectUser &&
            passwordInput == ConstantsString.loginButtonCorrectPassword) {
          isAuthenticated = true;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: ToastBar(
                detailMessage: ConstantsString.loginButtonSnackBarLoggedMessage,
              ),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UsersScreen(),
            ),
          );
        } else if (userInput != ConstantsString.loginButtonCorrectUser) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: ToastBar(
                detailMessage:
                    ConstantsString.loginButtonSnackBarIncorrectUserName,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: ToastBar(
                detailMessage:
                    ConstantsString.loginButtonSnackBarIncorrectPassword,
              ),
            ),
          );
        }
      },
    );
  }
}
