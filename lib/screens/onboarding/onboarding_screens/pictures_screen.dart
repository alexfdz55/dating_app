import 'package:dating_app/blocs/images/images_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;
  const Pictures({Key? key, required this.tabController}) : super(key: key);

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
                text: 'Add 2 or More Pictures',
              ),
              const SizedBox(height: 10),
              BlocBuilder<ImagesBloc, ImagesState>(
                builder: (context, state) {
                  if (state is ImagesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ImagesLoaded) {
                    int imagesCount = state.imaUrls.length;
                    print(imagesCount);
                    print(state.imaUrls[0]);

                    return Column(
                      children: [
                        Row(
                          children: [
                            (imagesCount > 0)
                                ? CustomImageContainer(
                                    imageUrl: state.imaUrls[0])
                                : const CustomImageContainer(),
                            (imagesCount > 1)
                                ? CustomImageContainer(
                                    imageUrl: state.imaUrls[1])
                                : const CustomImageContainer(),
                            (imagesCount > 2)
                                ? CustomImageContainer(
                                    imageUrl: state.imaUrls[2])
                                : const CustomImageContainer(),
                          ],
                        ),
                        Row(
                          children: [
                            (imagesCount > 3)
                                ? CustomImageContainer(
                                    imageUrl: state.imaUrls[3])
                                : const CustomImageContainer(),
                            (imagesCount > 4)
                                ? CustomImageContainer(
                                    imageUrl: state.imaUrls[4])
                                : const CustomImageContainer(),
                            (imagesCount > 5)
                                ? CustomImageContainer(
                                    imageUrl: state.imaUrls[5])
                                : const CustomImageContainer(),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Text('Something went wrong.');
                  }
                },
              ),
            ],
          ),
          StepAndNextButton(tabController: tabController, currentStep: 4),
        ],
      ),
    );
  }
}
