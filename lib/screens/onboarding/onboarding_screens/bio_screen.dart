import 'package:dating_app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class Biography extends StatelessWidget {
  final TabController tabController;
  const Biography({Key? key, required this.tabController}) : super(key: key);

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
                    const CustomTextHeader(text: 'Describe Yourself a Bit'),
                    CustomTextField(
                      text: 'ENTER YOUR BIO',
                      onChanged: (value) => onboardingBloc.add(
                        UpdateUser(user: state.user.copyWith(bio: value)),
                      ),
                    ),
                    const SizedBox(height: 100),
                    const CustomTextHeader(text: 'What Do You Like?'),
                    Row(
                      children: const [
                        CustomTextContainer(text: 'MUSIC'),
                        CustomTextContainer(text: 'ECONOMICS'),
                        CustomTextContainer(text: 'ART'),
                        CustomTextContainer(text: 'POLITICS')
                      ],
                    ),
                    Row(
                      children: const [
                        CustomTextContainer(text: 'NATURE'),
                        CustomTextContainer(text: 'HIKING'),
                        CustomTextContainer(text: 'FOOTBALL'),
                        CustomTextContainer(text: 'MOVIES')
                      ],
                    )
                  ],
                ),
                StepAndNextButton(tabController: tabController, currentStep: 5),
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
