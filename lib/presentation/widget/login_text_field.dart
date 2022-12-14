import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final bool obscureText;

  const LoginTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: textController,
        textAlign: TextAlign.start,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
