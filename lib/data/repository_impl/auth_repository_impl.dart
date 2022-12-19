import '../../core/util/constants.dart';
import '../../domain/repository/i_auth_repository.dart';
import '../model/auth_impl.dart';

class AuthRepositoryImpl extends IAuthRepository {
  AuthImpl auth = AuthImpl(
    isAuthenticated: true,
    textInput: Strings.emptyString,
  );

  @override
  AuthImpl getStatusAuth(params) {
    return auth;
  }
}
