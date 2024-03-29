import 'package:dating_app/blocs/blocs.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/repositories/auth/auth_repository.dart';
import 'package:dating_app/screens/screens.dart';
import 'package:dating_app/widgets/custom_appbar.dart';
import 'package:dating_app/widgets/custom_text_container.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          print(BlocProvider.of<AuthBloc>(context).state);

          return BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated
              ? const OnboardingScreen()
              : ProfileScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'PROFILE'),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileLoaded) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  UserImage.medium(
                    url: state.user.imageUrls[0],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(0.1),
                            Theme.of(context).primaryColor.withOpacity(0.9),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Text(
                            state.user.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleWithIcon(
                            title: 'Biography', icon: Icons.edit),
                        Text(
                          state.user.bio,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1.5),
                        ),
                        const TitleWithIcon(
                            title: 'Pictures', icon: Icons.edit),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: state.user.imageUrls.length > 0 ? 125 : 0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.user.imageUrls.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: UserImage.small(
                                  width: 100,
                                  url: state.user.imageUrls[index],
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const TitleWithIcon(
                            title: 'Location', icon: Icons.edit),
                        Text(
                          state.user.location,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1.5),
                        ),
                        const TitleWithIcon(
                            title: 'Interest', icon: Icons.edit),
                        Row(
                          children: [
                            CustomTextContainer(text: state.user.interests[0]),
                            // CustomTextContainer(text: 'ECONOMICS'),
                            // CustomTextContainer(text: 'FOOTBALL'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            RepositoryProvider.of<AuthRepository>(context)
                                .signOut();
                          },
                          child: Center(
                            child: Text(
                              'Sign Out',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Text('Something went wrong.');
            }
          },
        ),
      ),
    );
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const TitleWithIcon({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        )
      ],
    );
  }
}
