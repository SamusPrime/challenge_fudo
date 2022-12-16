import '../../core/usecases/i_usecase.dart';
import '../../data/model/auth_impl.dart';
import '../../data/model/post_impl.dart';
import '../repository/i_auth_repository.dart';

class GetAuthUseCase implements UseCase<AuthImpl, String> {
  final IAuthRepository _authRepository;

  GetAuthUseCase(this._authRepository);

  @override
  Future<AuthImpl> call({String? params}) async {
    return await _authRepository.getStatusAuth(params);
  }
}
