import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/route/nav_router.dart';
import '../../presentation/widget/widgets.dart';
import '../../core/util/constants.dart';
import '../bloc/auth_bloc_impl.dart';
import '../bloc/interfaces/i_auth_bloc.dart';
import '../view/screen.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController userInputController;
  final TextEditingController passwordInputController;
  final AuthBloc authBloc = AuthBloc();

  LoginButton({
    Key? key,
    required this.userInputController,
    required this.passwordInputController,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  late String validationResponse;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        validationResponse =
            Provider.of<IAuthBloc>(context, listen: false).validateInputs(
          widget.userInputController,
          widget.passwordInputController,
        );
        switch (validationResponse) {
          case ConstantsString.loginButtonSuccessMessage:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: ToastBar(
                  detailMessage:
                      ConstantsString.loginButtonSnackBarLoggedMessage,
                ),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NavRouter(),
              ),
            );
            break;
          case ConstantsString.loginButtonIncorrectUserMessage:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: ToastBar(
                  detailMessage:
                      ConstantsString.loginButtonSnackBarIncorrectUserName,
                ),
              ),
            );
            break;
          case ConstantsString.loginButtonSnackBarIncorrectPassword:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: ToastBar(
                  detailMessage:
                      ConstantsString.loginButtonSnackBarIncorrectPassword,
                ),
              ),
            );
            break;
        }
      },
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
}
