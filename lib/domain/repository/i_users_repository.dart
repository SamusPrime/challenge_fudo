import '../../data/model/user_model.dart';

abstract class IUsersRepository {
  Future<List<UserModel>> fetchUsers(endpoint);
}
