import '../../data/model/post_impl.dart';

abstract class IPostsRepository {
  Future<List<PostImpl>> fetchPosts(endpoint);

  Future<bool> sendPost(Map<String?, dynamic>? jsonBody);
}
