import 'package:dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:dating_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_router.dart';
import 'config/theme.dart';
import 'models/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                SwipeBloc()..add(LoadUsersEvent(users: User.users))),
      ],
      child: MaterialApp(
        title: 'Dating App',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: OnboardingScreen.routeName,
      ),
    );
  }
}
