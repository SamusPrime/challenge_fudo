import 'package:flutter/material.dart';
import '../../config/route/nav_router.dart';
import '../../core/util/constants.dart';
import '../widget/toast_bar.dart';
import 'interfaces/i_auth_bloc.dart';

class AuthBloc implements IAuthBloc {
  bool isAuthenticated = false;

  @override
  getStatusAuth() => isAuthenticated;

  @override
  void dispose() {}

  @override
  void initialize() {}

  @override
  String validateInputs(
    TextEditingController userInputController,
    TextEditingController passwordInputController,
  ) {
    if (userInputController.text == ConstantsString.loginButtonCorrectUser &&
        passwordInputController.text ==
            ConstantsString.loginButtonCorrectPassword) {
      isAuthenticated = true;
      return ConstantsString.loginButtonSuccessMessage;
    } else if (userInputController.text !=
        ConstantsString.loginButtonCorrectUser) {
      return ConstantsString.loginButtonIncorrectUserMessage;
    } else {
      return ConstantsString.loginButtonIncorrectPasswordMessage;
    }
  }
}
