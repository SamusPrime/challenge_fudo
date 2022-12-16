import '../../core/usecases/i_usecase.dart';
import '../../data/model/post_impl.dart';
import 'interfaces/i_posts_bloc.dart';

class PostBlocImpl implements IPostsBloc {
  final UseCase _getPostsUseCase;

  PostBlocImpl(this._getPostsUseCase);

  @override
  void dispose() {}

  @override
  Future<List<PostImpl>> getPosts(endpoint) async {
    return await _getPostsUseCase(params: endpoint);
  }

  @override
  void initialize() {}
}
