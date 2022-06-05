import 'package:dating_app/blocs/auth/auth_bloc.dart';
import 'package:dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:dating_app/repositories/auth/auth_repository.dart';
import 'package:dating_app/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_router.dart';
import 'config/theme.dart';
import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (_) => AuthRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
          ),
          BlocProvider(
            create: (context) =>
                SwipeBloc()..add(LoadUsersEvent(users: User.users)),
          ),
          // BlocProvider<SignupCubit>(
          //   create: (context) => SignupCubit(
          //       authRepository: RepositoryProvider.of<AuthRepository>(context)),
          // ),
        ],
        child: MaterialApp(
          title: 'Dating App',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: OnboardingScreen.routeName,
        ),
      ),
    );
  }
}
