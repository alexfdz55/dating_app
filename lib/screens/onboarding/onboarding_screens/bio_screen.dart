import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Biography extends StatelessWidget {
  final TabController tabController;
  const Biography({Key? key, required this.tabController}) : super(key: key);

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
                text: 'Describe Yourself a Bit',
              ),
              CustomTextField(
                tabController: tabController,
                text: 'ENTER YOUR BIO',
              ),
              const SizedBox(height: 100),
              CustomTextHeader(
                tabController: tabController,
                text: 'What Do You Like?',
              ),
              Row(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'MUSIC'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ECONOMICS'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ART'),
                  CustomTextContainer(
                      tabController: tabController, text: 'POLITICS')
                ],
              ),
              Row(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'NATURE'),
                  CustomTextContainer(
                      tabController: tabController, text: 'HIKING'),
                  CustomTextContainer(
                      tabController: tabController, text: 'FOOTBALL'),
                  CustomTextContainer(
                      tabController: tabController, text: 'MOVIES')
                ],
              )
            ],
          ),
          StepAndNextButton(tabController: tabController, currentStep: 5),
        ],
      ),
    );
  }
}
