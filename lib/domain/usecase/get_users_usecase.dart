import '../../core/usecases/i_usecase.dart';

import '../../data/model/user_impl.dart';

import '../repository/i_users_repository.dart';

class GetUsersUseCase implements UseCase<List<UserImpl>, String> {
  final IUsersRepository _usersRepository;

  GetUsersUseCase(this._usersRepository);

  @override
  Future<List<UserImpl>> call({String? params}) async {
    return await _usersRepository.fetchUsers(params);
  }
}
