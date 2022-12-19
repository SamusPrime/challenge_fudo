import '../../core/usecases/i_usecase.dart';
import '../../data/model/user_impl.dart';

import 'interfaces/i_users_bloc.dart';

class UserBlocImpl implements IUsersBloc {
  final UseCase _getUsersUseCase;

  UserBlocImpl(this._getUsersUseCase);

  @override
  void dispose() {

  }

  @override
  Future<List<UserImpl>> getUsers(endpoint) async {
    return await _getUsersUseCase(params: endpoint);
  }

  @override
  void initialize() {

  }
}
