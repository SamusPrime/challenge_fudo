import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/util/constants.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _fireStore.collection(
  ConstantsString.mainUsersFirebaseCollection,
);

class Database {
  Future<void> addUsers({
    required List<dynamic> users,
    required String mainCollectionDocument,
    required String subCollection,
  }) async {
    WriteBatch batch = _fireStore.batch();
    users.forEach((user) {
      DocumentReference documentReferencer = _mainCollection
          .doc(mainCollectionDocument)
          .collection(subCollection)
          .doc(
            users[user].toString(),
          );
      batch.set(
        documentReferencer,
        user,
        SetOptions(merge: true),
      );
    });
    batch.commit();
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
}
