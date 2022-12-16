import '../../core/usecases/i_usecase.dart';
import '../../data/model/user_model.dart';

import 'interfaces/i_users_bloc.dart';

class UserBlocImpl implements IUsersBloc {
  final UseCase _getUsersUseCase;

  UserBlocImpl(this._getUsersUseCase);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<List<UserModel>> getUsers(endpoint) async {
    return await _getUsersUseCase(params: endpoint);
  }

  @override
  void initialize() {
    // TODO: implement initialize
  }
}
