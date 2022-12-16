import '../../core/usecases/i_usecase.dart';

import '../../data/model/user_model.dart';

import '../repository/i_users_repository.dart';

class GetUsersUseCase implements UseCase<List<UserModel>, String> {
  final IUsersRepository _usersRepository;

  GetUsersUseCase(this._usersRepository);

  @override
  Future<List<UserModel>> call({String? params}) async {
    return await _usersRepository.fetchUsers(params);
  }
}
