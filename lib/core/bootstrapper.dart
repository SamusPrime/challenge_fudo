import 'usecases/i_usecase.dart';
import '../data/datasource/local/DAOs/database_posts.dart';
import '../data/datasource/local/DAOs/database_users.dart';
import '../data/datasource/remote/api_service.dart';
import '../data/repository_impl/posts_repository_impl.dart';
import '../data/repository_impl/users_repository_impl.dart';
import '../domain/repository/i_posts_repository.dart';
import '../domain/repository/i_users_repository.dart';
import '../domain/usecase/get_posts_usecase.dart';
import '../domain/usecase/get_users_usecase.dart';
import '../domain/usecase/create_post_usecase.dart';
import '../presentation/bloc/auth_bloc_impl.dart';
import '../presentation/bloc/interfaces/i_auth_bloc.dart';
import '../presentation/bloc/interfaces/i_posts_bloc.dart';
import '../presentation/bloc/interfaces/i_users_bloc.dart';
import '../presentation/bloc/post_bloc_impl.dart';
import '../presentation/bloc/user_bloc_impl.dart';
import 'package:http/http.dart' as http;

class Bootstrapper {
  late IAuthBloc _authBloc;
  late IUsersBloc _usersBloc;
  late IPostsBloc _postsBloc;
  late DatabaseUsers _dbUsers;
  late DatabasePosts _dbPosts;
  late http.Client _client;
  late ApiService _service;
  late IUsersRepository _usersRepository;
  late IPostsRepository _postsRepository;
  late UseCase _getUsersUseCase;
  late UseCase _getPostsUseCase;
  late UseCase _createPostUseCase;

  IAuthBloc get authBloc => _authBloc;

  IUsersBloc get usersBloc => _usersBloc;

  IPostsBloc get postsBloc => _postsBloc;

  void dispose() {
    authBloc.dispose();
    usersBloc.dispose();
    postsBloc.dispose();
  }

  void initialize() {
    _authBloc = AuthBloc();
    _client = http.Client();
    _dbUsers = DatabaseUsers();
    _dbPosts = DatabasePosts();
    _service = ApiService(client: _client);
    _usersRepository = UsersRepository(
      _service,
      _dbUsers,
    );
    _postsRepository = PostsRepository(
      _service,
      _dbPosts,
    );
    _getUsersUseCase = GetUsersUseCase(_usersRepository);
    _getPostsUseCase = GetPostsUseCase(_postsRepository);
    _createPostUseCase = CreatePostUseCase(_postsRepository);
    _usersBloc = UserBlocImpl(
      _getUsersUseCase,
    );
    _postsBloc = PostBlocImpl(
      _getPostsUseCase,
      _createPostUseCase,
    );
  }
}
