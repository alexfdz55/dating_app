import 'package:dating_app/blocs/blocs.dart';
import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:dating_app/repositories/auth/auth_repository.dart';
import 'package:dating_app/repositories/database/database_repository.dart';
import 'package:dating_app/repositories/storage/storage_repository.dart';
import 'package:dating_app/screens/onboarding/onboarding_screens/email_verification_screen.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'onboarding_screens/screens.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => OnboardingScreen(),
    );
  }

  // static Route route() {
  //   return MaterialPageRoute(
  //     settings: RouteSettings(name: routeName),
  //     builder: (context) => MultiBlocProvider(
  //       providers: [
  //         BlocProvider<SignupCubit>(
  //           create: (_) => SignupCubit(
  //             authRepository: RepositoryProvider.of<AuthRepository>(context),
  //           ),
  //         ),
  //         BlocProvider<OnboardingBloc>(
  //           create: (_) => OnboardingBloc(
  //             databaseRepository:
  //                 RepositoryProvider.of<DatabaseRepository>(context),
  //             storageRepository:
  //                 RepositoryProvider.of<StorageRepository>(context),
  //           )..add(StartOnboarding()),
  //         ),
  //       ],
  //       child: OnboardingScreen(),
  //     ),
  //   );
  // }

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'Email Verification'),
    Tab(text: 'Demographics'),
    Tab(text: 'Pictures'),
    Tab(text: 'Biography'),
    Tab(text: 'Location')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context)!;

          return Scaffold(
            appBar: const CustomAppbar(hasAction: false, title: 'ARROW'),
            body: TabBarView(children: [
              Start(tabController: tabController),
              Email(tabController: tabController),
              EmailVerification(tabController: tabController),
              Demographipcs(tabController: tabController),
              Pictures(tabController: tabController),
              Biography(tabController: tabController),
              Location(tabController: tabController),
            ]),
          );
        },
      ),
    );
  }
}
