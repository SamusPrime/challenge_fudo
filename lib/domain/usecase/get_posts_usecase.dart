import '../../core/usecases/i_usecase.dart';
import '../../data/model/post_impl.dart';
import '../repository/i_posts_repository.dart';

class GetPostsUseCase implements UseCase<List<PostImpl>, String> {
  final IPostsRepository _postsRepository;

  GetPostsUseCase(this._postsRepository);

  @override
  Future<List<PostImpl>> call({String? params}) async {
    return await _postsRepository.fetchPosts(params);
  }
}
