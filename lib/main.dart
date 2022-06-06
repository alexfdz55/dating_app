import 'package:dating_app/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';
import 'config/app_router.dart';
import 'config/theme.dart';
import 'models/models.dart';
import 'repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => DatabaseRepository()),
        RepositoryProvider(create: (context) => StorageRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
          ),

          BlocProvider(
            create: (_) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
          ),

          BlocProvider(
            create: (context) => SwipeBloc()..add(LoadUsers(users: User.users)),
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
