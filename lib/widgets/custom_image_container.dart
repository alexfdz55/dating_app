import 'package:dating_app/blocs/onboarding/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  final String? imageUrl;
  const CustomImageContainer({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final border = BorderSide(color: theme.primaryColor, width: 1);
    return Container(
        margin: const EdgeInsets.only(bottom: 10, right: 10),
        height: 150,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border(
              bottom: border,
              left: border,
              right: border,
              top: border,
            )),
        child: imageUrl == null
            ? Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.add_circle, color: theme.accentColor),
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No image was selected')),
                      );
                    }

                    if (image != null) {
                      print('Uploading ...');
                      // StorageRepository().uploadImage(image);
                      // ignore: use_build_context_synchronously
                      BlocProvider.of<OnboardingBloc>(context)
                          .add(UpdateUserImage(image: image));
                    }
                  },
                ),
              )
            : Image.network(imageUrl!, fit: BoxFit.cover));
  }
}
