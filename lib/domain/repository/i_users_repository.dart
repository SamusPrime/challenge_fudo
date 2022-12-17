import '../../data/model/user_impl.dart';

abstract class IUsersRepository {
  Future<List<UserImpl>> fetchUsers(endpoint);
}
