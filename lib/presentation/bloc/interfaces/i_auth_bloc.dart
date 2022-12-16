import 'package:flutter/material.dart';

import '../../../core/bloc_i/i_bloc.dart';

abstract class IAuthBloc implements Bloc {
  @override
  void initialize();

  @override
  void dispose();

  String validateInputs(
    String userInput,
    String passwordInput,
  );

  bool getStatusAuth();
}
