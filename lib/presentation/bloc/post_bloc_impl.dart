import '../../core/usecases/i_usecase.dart';
import '../../data/model/post_impl.dart';
import 'interfaces/i_posts_bloc.dart';

class PostBlocImpl implements IPostsBloc {
  final UseCase _getPostsUseCase;
  final UseCase _getCreatePostUseCase;
  List<PostImpl> listOfPostsRecentlyCreated = [];

  PostBlocImpl(this._getPostsUseCase, this._getCreatePostUseCase);

  @override
  void dispose() {}

  @override
  Future<bool> createPosts(jsonBody) async {
    return await _getCreatePostUseCase(params: jsonBody);
  }

  @override
  Future<List<PostImpl>> getPosts(endpoint) async {
    return await _getPostsUseCase(params: endpoint);
  }

  @override
  void initialize() {}
}
