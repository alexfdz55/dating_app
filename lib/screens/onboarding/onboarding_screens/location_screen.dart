import 'package:dating_app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/widgets.dart';

class Location extends StatelessWidget {
  final TabController tabController;
  const Location({Key? key, required this.tabController}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeader(text: 'Where Are You?'),
                  CustomTextField(
                    text: 'ENTER YOUR LOCATION',
                    onChanged: (value) {
                      onboardingBloc.add(
                        UpdateUser(
                          user: state.user.copyWith(location: value),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 6,
                    selectedColor: Theme.of(context).primaryColor,
                    unselectedColor: Theme.of(context).backgroundColor,
                  ),
                  SizedBox(height: 10),
                  CustomButton(tabController: tabController, text: 'DONE'),
                ],
              ),
            ],
          ),
        );
      } else {
        return const Text('Something went wrong.');
      }
    });
  }
}
