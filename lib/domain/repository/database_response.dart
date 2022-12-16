import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/datasource/local/DAOs/database.dart';
import '../../data/model/user_model.dart';

mixin DatabaseResponse {
  Database get database;

  Future<List<UserModel>> getUsersFromDatabase({
    required String document,
    required String subCollection,
  }) async {
    List<UserModel> usersList = [];
    try {
      QuerySnapshot dbResponse = await database.readUsers(
        mainCollectionDocument: document,
        subCollection: subCollection,
      );
      if (dbResponse.docs.isEmpty) {
        return usersList;
      } else {
        List<QueryDocumentSnapshot> users = dbResponse.docs;
        users.forEach((user) {
          usersList.add(
            UserModel.fromJson(user),
          );
        });
        return usersList;
      }
    } catch (e) {
      return Future.error('Error');
    }
  }
}
