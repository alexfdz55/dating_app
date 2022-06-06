import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class EmailVerification extends StatelessWidget {
  final TabController tabController;
  const EmailVerification({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final codeTextCtrl = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const CustomTextHeader(
                  text: 'Did You Get THe Verification Code?'),
              CustomTextField(controller: codeTextCtrl, text: 'ENTER YOUR CODE')
            ],
          ),
          StepAndNextButton(tabController: tabController, currentStep: 2),
        ],
      ),
    );
  }
}
