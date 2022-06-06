import 'package:dating_app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;
  const Pictures({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OnboardingLoaded) {
          var images = state.user.imageUrls;
          int imagesCount = images.length;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextHeader(text: 'Add 2 or More Pictures'),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 350,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.66,
                        ),
                        itemCount: 6,
                        itemBuilder: (_, index) => (imagesCount > index)
                            ? CustomImageContainer(imageUrl: images[index])
                            : const CustomImageContainer(),
                      ),
                    ),
                  ],
                ),
                StepAndNextButton(tabController: tabController, currentStep: 4),
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
