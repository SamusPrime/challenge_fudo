import 'dart:convert';
import 'dart:io';

import '../../domain/repository/database_response.dart';
import '../../domain/repository/i_users_repository.dart';
import '../datasource/local/DAOs/database.dart';
import '../datasource/remote/api_service.dart';
import '../model/user_model.dart';

class UsersRepository with DatabaseResponse implements IUsersRepository {
  final ApiService _service;
  final Database _db;

  UsersRepository(
    this._service,
    this._db,
  );

  @override
  Database get database => _db;

  @override
  Future<List<UserModel>> fetchUsers(endpoint) async {
    List<UserModel> usersList = [];

    int startIndex = endpoint.lastIndexOf('/');
    String document = endpoint.substring(startIndex + 1) + '_doc';
    String subCollection = endpoint.substring(startIndex + 1);

    try {
      var apiResponse = await _service.apiCall(endpoint: endpoint);
      if (apiResponse.statusCode == HttpStatus.ok) {
        List<dynamic> users = json.decode(apiResponse.body);

        if (users.isEmpty) {
          return usersList;
        } else {
          users.forEach((user) {
            usersList.add(UserModel.fromJson(user));
          });
   /*            _db.addUsers(
            users: users,
            mainCollectionDocument: document,
            subCollection: subCollection,
          ); */
          return usersList;
        }
      }
      return getUsersFromDatabase(
        document: document,
        subCollection: subCollection,
      );
    } catch (e) {
      return getUsersFromDatabase(
        document: document,
        subCollection: subCollection,
      );
    }
  }
}
