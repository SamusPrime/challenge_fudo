import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repository/i_users_repository.dart';
import '../datasource/local/DAOs/database_users.dart';
import '../datasource/remote/api_service.dart';
import '../model/user_impl.dart';

class UsersRepository extends DatabaseUsers implements IUsersRepository {
  final ApiService _service;
  final DatabaseUsers _dbUsers;

  UsersRepository(
    this._service,
    this._dbUsers,
  );

  @override
  Future<List<UserImpl>> fetchUsers(endpoint) async {
    List<UserImpl> usersList = [];

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
            usersList.add(UserImpl.fromJson(user));
          });
          /*            _dbUsers.addUsers(
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

  Future<List<UserImpl>> modelResponse(
    List<QueryDocumentSnapshot> response,
  ) async {
    List<UserImpl> usersList = [];
    List<QueryDocumentSnapshot> users = response;
    users.forEach((post) {
      usersList.add(
        UserImpl.fromJson(post),
      );
    });
    return usersList;
  }
}
