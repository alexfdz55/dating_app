import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'custom_button.dart';

class StepAndNextButton extends StatelessWidget {
  final TabController tabController;
  final int currentStep;
  const StepAndNextButton({
    Key? key,
    required this.tabController,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        StepProgressIndicator(
          totalSteps: 6,
          currentStep: currentStep,
          selectedColor: theme.primaryColor,
          unselectedColor: theme.backgroundColor,
        ),
        const SizedBox(height: 10),
        CustomButton(
          tabController: tabController,
          text: 'NEXT STEP',
        )
      ],
    );
  }
}
