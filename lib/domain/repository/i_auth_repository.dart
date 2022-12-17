import '../../data/model/auth_impl.dart';

abstract class IAuthRepository {
  AuthImpl getStatusAuth(String? params);
}
