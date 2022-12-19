import '../../core/usecases/i_usecase.dart';

import '../repository/i_posts_repository.dart';

class CreatePostUseCase implements UseCase<bool, Map<String?, dynamic>> {
  final IPostsRepository _postsRepository;

  CreatePostUseCase(this._postsRepository);

  @override
  Future<bool> call({
    Map<String?, dynamic>? params,
  }) async {
    return await _postsRepository.sendPost(params);
  }
}
