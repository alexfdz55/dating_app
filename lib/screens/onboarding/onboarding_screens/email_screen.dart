import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/widgets.dart';

class Email extends StatelessWidget {
  final TabController tabController;
  const Email({Key? key, required this.tabController}) : super(key: key);

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
                text: 'What\'s Your Email Address?',
              ),
              CustomTextField(
                  tabController: tabController, text: 'ENTER YOUR EMAIL')
            ],
          ),
          StepAndNextButton(tabController: tabController, currentStep: 1),
        ],
      ),
    );
  }
}
