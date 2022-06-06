import 'package:dating_app/blocs/onboarding/onboarding_bloc.dart';
import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:dating_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomButton({
    Key? key,
    required this.tabController,
    this.text = 'START',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);

    final onboardingBloc = BlocProvider.of<OnboardingBloc>(context);
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: LinearGradient(colors: [
            theme.primaryColor,
            theme.accentColor,
          ])),
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(elevation: 0, primary: Colors.transparent),
        onPressed: () async {
          if (tabController.index == 5) {
            Navigator.pushNamed(context, '/');
          } else {
            tabController.animateTo(tabController.index + 1);
          }

          if (tabController.index == 2) {
            await signupCubit.signUpWithCredentials();
            User user = User(
              // ignore: use_build_context_synchronously
              id: signupCubit.state.user!.uid,
              name: '',
              age: 0,
              gender: '',
              imageUrls: [],
              jobTitle: '',
              interests: [],
              bio: '',
              location: '',
            );
            onboardingBloc.add(StartOnboarding(user: user));
          }
        },
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: theme.textTheme.headline4!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
