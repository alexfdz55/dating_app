import 'package:dating_app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class Demographipcs extends StatelessWidget {
  final TabController tabController;
  const Demographipcs({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final onboardingBloc = BlocProvider.of<OnboardingBloc>(context);

        if (state is OnboardingLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OnboardingLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextHeader(text: 'What\'s Your Gender?'),
                    const SizedBox(height: 10),
                    CustomCheckbox(
                      text: 'MALE',
                      value: state.user.gender == 'Male' ? true : false,
                      onChanged: (value) => onboardingBloc.add(
                        UpdateUser(user: state.user.copyWith(gender: 'Male')),
                      ),
                    ),
                    CustomCheckbox(
                      text: 'FEMALE',
                      value: state.user.gender == 'FEMALE' ? true : false,
                      onChanged: (value) => onboardingBloc.add(
                        UpdateUser(user: state.user.copyWith(gender: 'FEMALE')),
                      ),
                    ),
                    const SizedBox(height: 100),
                    const CustomTextHeader(text: 'What\'s Your Age?'),
                    CustomTextField(
                      text: 'ENTER YOUR AGE',
                      onChanged: (value) => onboardingBloc.add(
                        UpdateUser(
                            user: state.user.copyWith(age: int.parse(value))),
                      ),
                    )
                  ],
                ),
                StepAndNextButton(tabController: tabController, currentStep: 3),
              ],
            ),
          );
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }
}
