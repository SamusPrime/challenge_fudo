abstract class Auth {
  Auth({
    required this.isAuthenticated,
    required this.textInput,
  });

  final bool isAuthenticated;
  final String textInput;
}
