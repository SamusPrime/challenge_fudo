import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

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
    String userInput,
    String passwordInput,
  ) {
    if (userInput == Strings.loginButtonCorrectUser &&
        passwordInput == Strings.loginButtonCorrectPassword) {
      isAuthenticated = true;
      return Strings.loginButtonSuccessMessage;
    } else if (userInput != Strings.loginButtonCorrectUser) {
      return Strings.loginButtonIncorrectUserMessage;
    } else {
      return Strings.loginButtonIncorrectPasswordMessage;
    }
  }
}
