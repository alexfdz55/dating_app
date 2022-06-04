import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Demographipcs extends StatelessWidget {
  final TabController tabController;
  const Demographipcs({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(
                tabController: tabController,
                text: 'What\'s Your Gender?',
              ),
              const SizedBox(height: 10),
              CustomCheckbox(tabController: tabController, text: 'MALE'),
              CustomCheckbox(tabController: tabController, text: 'FEMALE'),
              const SizedBox(height: 100),
              CustomTextHeader(
                tabController: tabController,
                text: 'What\'s Your Age?',
              ),
              CustomTextField(
                tabController: tabController,
                text: 'ENTER YOUR AGE',
              )
            ],
          ),
          StepAndNextButton(tabController: tabController, currentStep: 3),
        ],
      ),
    );
  }
}
