import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/util/constants.dart';
import '../../../model/post_impl.dart';


final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

final CollectionReference _mainCollection = _fireStore.collection(
  Strings.mainPostsFirebaseCollection,
);

class DatabasePosts {
  Future<void> addPosts({
    required List<dynamic> posts,
  }) async {
    CollectionReference collectionReference = _fireStore.collection(
      Strings.mainPostsFirebaseCollection,
    );
    var documents = await collectionReference.get();
    documents.docs.forEach((doc) {
      doc.reference.delete();
    });

    posts.forEach((post) {
      collectionReference.add(post);
    });
  }

  Future<QuerySnapshot> readPosts({
    required String mainCollectionDocument,
    required String subCollection,
  }) async {

    CollectionReference postsCollection =
        _mainCollection.doc(mainCollectionDocument).collection(subCollection);
    var response = await postsCollection.get();
    return response;
  }

  Future<List<PostImpl>> getPostsFromDatabase({
    required String document,
    required String subCollection,
  }) async {

    List<PostImpl> postsList = [];

    try {
      QuerySnapshot dbResponse = await readPosts(
        mainCollectionDocument: document,
        subCollection: subCollection,
      );
      if (dbResponse.docs.isEmpty) {
        return postsList;
      } else {
        List<QueryDocumentSnapshot> posts = dbResponse.docs;
        posts.forEach((post) {
          postsList.add(
            PostImpl.fromJson(post),
          );
        });
        return postsList;
      }
    } catch (e) {
      return Future.error(
        Strings.databaseFutureError,
      );
    }
  }
}
