import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/util/constants.dart';
import '../../../model/post_impl.dart';
import '../../../repository_impl/posts_repository_impl.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _fireStore.collection(
  Strings.mainPostsFirebaseCollection,
);

class DatabasePosts {
  late PostsRepository _postRepo;

  PostsRepository get repoPost => _postRepo;

  Future<void> addPosts({
    required List<dynamic> posts,
    required String mainCollectionDocument,
    required String subCollection,
  }) async {
    WriteBatch batch = _fireStore.batch();
    posts.forEach((post) {
      DocumentReference documentReferencer = _mainCollection
          .doc(mainCollectionDocument)
          .collection(subCollection)
          .doc(
            posts[post].toString(),
          );
      batch.set(
        documentReferencer,
        post,
        SetOptions(merge: true),
      );
    });
    batch.commit();
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
        postsList = await _postRepo.modelResponse(dbResponse.docs);
        return postsList;
      }
    } catch (e) {
      return Future.error(
        Strings.databaseFutureError,
      );
    }
  }
}
