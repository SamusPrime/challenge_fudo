import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/bootstrapper.dart';
import 'presentation/bloc/interfaces/i_posts_bloc.dart';
import 'presentation/bloc/interfaces/i_users_bloc.dart';
import 'core/util/constants.dart';
import 'presentation/bloc/interfaces/i_auth_bloc.dart';
import 'presentation/view/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  runApp(
    const FudoChallenge(),
  );
}

class FudoChallenge extends StatefulWidget {
  const FudoChallenge({super.key});

  @override
  State<FudoChallenge> createState() => _FudoChallengeState();
}

class _FudoChallengeState extends State<FudoChallenge> {
  final boot = Bootstrapper();

  @override
  void initState() {
    boot.initialize();
    super.initState();
  }

  @override
  void dispose() {
    boot.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAuthBloc>.value(value: boot.authBloc),
        Provider<IUsersBloc>.value(value: boot.usersBloc),
        Provider<IPostsBloc>.value(value: boot.postsBloc),
      ],
      child: MaterialApp(
        title: Strings.mainAppTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Palette.mainScaffoldBackground,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
