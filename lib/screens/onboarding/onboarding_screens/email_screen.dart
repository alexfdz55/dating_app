import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class Email extends StatelessWidget {
  final TabController tabController;
  const Email({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        final signupCubit = BlocProvider.of<SignupCubit>(context);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomTextHeader(text: 'What\'s Your Email Address?'),
                  CustomTextField(
                    text: 'ENTER YOUR EMAIL',
                    onChanged: (value) {
                      signupCubit.emailChanged(value);
                      print(state.email);
                    },
                  ),
                  const SizedBox(height: 100),
                  CustomTextHeader(text: 'Choose a Password'),
                  CustomTextField(
                    text: 'ENTER YOUR PASSWORD',
                    onChanged: (value) => signupCubit.passwordChanged(value),
                  ),
                ],
              ),
              StepAndNextButton(
                tabController: tabController,
                currentStep: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
