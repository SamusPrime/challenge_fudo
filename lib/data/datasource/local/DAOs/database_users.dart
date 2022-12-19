import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/util/constants.dart';
import '../../../model/user_impl.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _fireStore.collection(
  Strings.mainUsersFirebaseCollection,
);

class DatabaseUsers {
  Future<void> addUsers({
    required List<dynamic> users,
  }) async {
    CollectionReference collectionReference = _fireStore.collection(
      Strings.mainUsersFirebaseCollection,
    );
    var documents = await collectionReference.get();
    documents.docs.forEach((doc) {
      doc.reference.delete();
    });

    users.forEach((user) {
      collectionReference.add(user);
    });
  }

  Future<QuerySnapshot> readUsers({
    required String mainCollectionDocument,
    required String subCollection,
  }) async {
    CollectionReference usersCollection =
        _mainCollection.doc(mainCollectionDocument).collection(subCollection);
    var response = await usersCollection.get();
    return response;
  }

  Future<List<UserImpl>> getUsersFromDatabase({
    required String document,
    required String subCollection,
  }) async {
    List<UserImpl> usersList = [];

    try {
      QuerySnapshot dbResponse = await readUsers(
        mainCollectionDocument: document,
        subCollection: subCollection,
      );
      if (dbResponse.docs.isEmpty) {
        return usersList;
      } else {
        List<QueryDocumentSnapshot> users = dbResponse.docs;
        users.forEach((user) {
          usersList.add(
            UserImpl.fromJson(user),
          );
        });
        return usersList;
      }
    } catch (e) {
      return Future.error(
        Strings.databaseFutureError,
      );
    }
  }
}
