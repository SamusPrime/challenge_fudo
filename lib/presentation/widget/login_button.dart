import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_bar.dart';
import '../../presentation/widget/widgets.dart';
import '../../core/util/constants.dart';
import '../bloc/auth_bloc_impl.dart';
import '../bloc/interfaces/i_auth_bloc.dart';
import 'button_custom_style.dart';

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
          widget.userInputController.text,
          widget.passwordInputController.text,
        );
        switch (validationResponse) {
          case Strings.loginButtonSuccessMessage:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: ToastBar(
                  detailMessage: Strings.loginButtonSnackBarLoggedMessage,
                ),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomBottomNavigationBar(),
              ),
            );
            break;
          case Strings.loginButtonIncorrectUserMessage:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: ToastBar(
                  detailMessage: Strings.loginButtonSnackBarIncorrectUserName,
                ),
              ),
            );
            break;
          case Strings.loginButtonSnackBarIncorrectPassword:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: ToastBar(
                  detailMessage: Strings.loginButtonSnackBarIncorrectPassword,
                ),
              ),
            );
            break;
        }
      },
      child: ButtonCustomStyle(
        buttonText: Strings.loginButtonText,
      ),
    );
  }
}
