import '../../../core/bloc_i/i_bloc.dart';
import '../../../data/model/post_impl.dart';

abstract class IPostsBloc implements Bloc {
  @override
  void initialize();

  @override
  void dispose();

  Future<List<PostImpl>> getPosts(endpoint);

  Future<bool> createPosts(jsonBody);

}
