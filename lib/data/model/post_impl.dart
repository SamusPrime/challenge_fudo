import '../../domain/entity/post.dart';

class PostImpl extends Post {
  PostImpl({
    required super.userId,
    required super.id,
    required super.title,
    super.body,
  });

  factory PostImpl.fromJson(dynamic postsJson) {
    return PostImpl(
      userId: postsJson['userId'] as int,
      id: postsJson['id'] as int,
      title: postsJson['title'] as String,
      body: postsJson['body'] as String,
    );
  }
}
