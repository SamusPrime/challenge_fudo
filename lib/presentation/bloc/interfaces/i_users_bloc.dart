import '../../../core/bloc_i/i_bloc.dart';
import '../../../data/model/user_model.dart';

abstract class IUsersBloc implements Bloc {
  @override
  void initialize();

  @override
  void dispose();

  Future<List<UserModel>> getUsers(endpoint);
}
