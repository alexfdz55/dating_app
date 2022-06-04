import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Biography extends StatelessWidget {
  final TabController tabController;
  const Biography({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bioTextCtrl = TextEditingController();
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
                controller: bioTextCtrl,
                text: 'ENTER YOUR BIO',
              ),
              const SizedBox(height: 100),
              CustomTextHeader(
                tabController: tabController,
                text: 'What Do You Like?',
              ),
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
  }
}
