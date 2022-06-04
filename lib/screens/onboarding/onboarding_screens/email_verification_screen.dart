import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class EmailVerification extends StatelessWidget {
  final TabController tabController;
  const EmailVerification({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextHeader(
                tabController: tabController,
                text: 'Did You Get THe Verification Code?',
              ),
              CustomTextField(
                  tabController: tabController, text: 'ENTER YOUR CODE')
            ],
          ),
          StepAndNextButton(tabController: tabController, currentStep: 2),
        ],
      ),
    );
  }
}
