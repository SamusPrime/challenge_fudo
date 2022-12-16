import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'presentation/bloc/user_bloc_impl.dart';
import 'data/repository_impl/users_repository_impl.dart';
import 'domain/usecase/get_users_usecase.dart';
import 'presentation/bloc/interfaces/i_users_bloc.dart';
import 'core/usecases/i_usecase.dart';
import 'data/datasource/local/DAOs/database.dart';
import 'data/datasource/remote/api_service.dart';
import 'domain/repository/i_users_repository.dart';
import 'package:http/http.dart' as http;
import 'presentation/bloc/auth_bloc_impl.dart';
import 'core/util/constants.dart';
import 'presentation/bloc/interfaces/i_auth_bloc.dart';
import 'presentation/view/screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FudoChallenge());
}

class FudoChallenge extends StatefulWidget {
  const FudoChallenge({super.key});

  @override
  State<FudoChallenge> createState() => _FudoChallengeState();
}

class _FudoChallengeState extends State<FudoChallenge> {
  late AuthBloc _authBloc;
  late Database _db;
  late http.Client _client;
  late ApiService _service;
  late IUsersRepository _usersRepository;
  late UseCase _getUsersUseCase;
  late IUsersBloc _usersBloc;

  @override
  void initState() {
    _authBloc = AuthBloc();
    _client = http.Client();
    _db = Database();
    _service = ApiService(client: _client);
    _usersRepository = UsersRepository(
      _service,
      _db,
    );
    _getUsersUseCase = GetUsersUseCase(_usersRepository);
    _usersBloc = UserBlocImpl(
      _getUsersUseCase,
    );
    super.initState();
  }

  @override
  void dispose() {
    _authBloc.dispose();
    _usersBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAuthBloc>.value(value: _authBloc),
        Provider<IUsersBloc>.value(value: _usersBloc),
      ],
      child: MaterialApp(
        title: ConstantsString.mainAppTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: ConstantsPalette.mainScaffoldBackground,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
