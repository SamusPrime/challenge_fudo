import '../../domain/entity/auth.dart';
import '../../domain/repository/i_auth_repository.dart';
import '../model/auth_impl.dart';

class AuthRepositoryImpl extends IAuthRepository {
  AuthImpl auth = AuthImpl(
    isAuthenticated: true,
    textInput: '',
  );

  @override
  AuthImpl getStatusAuth(String) {
    return auth;
  }
}
