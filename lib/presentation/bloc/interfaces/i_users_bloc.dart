import '../../../core/bloc_i/i_bloc.dart';
import '../../../data/model/user_impl.dart';

abstract class IUsersBloc implements Bloc {
  @override
  void initialize();

  @override
  void dispose();

  Future<List<UserImpl>> getUsers(endpoint);
}
