import 'package:dating_app/blocs/blocs.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';

class UsersScreen extends StatelessWidget {
  final User user;
  const UsersScreen({Key? key, required this.user}) : super(key: key);

  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => UsersScreen(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Hero(
                  tag: 'user_image',
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(user.imageUrls[0]))),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 60.0,
                    ),
                    child: BlocBuilder<SwipeBloc, SwipeState>(
                      builder: (context, state) {
                        final swipeBloc = BlocProvider.of<SwipeBloc>(context);

                        if (state is SwipeLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is SwipeLoaded) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ChoiceButton(
                                color: theme.accentColor,
                                icon: Icons.clear_rounded,
                                onTap: () {
                                  swipeBloc
                                      .add(SwipeRight(user: state.users[0]));
                                  Navigator.pop(context);
                                  print('Swiped Right');
                                },
                              ),
                              ChoiceButton(
                                height: 80,
                                width: 80,
                                size: 30,
                                hasGradient: true,
                                color: Colors.white,
                                icon: Icons.favorite,
                                onTap: () {
                                  swipeBloc
                                      .add(SwipeRight(user: state.users[0]));
                                  Navigator.pop(context);
                                  print('Swiped Right');
                                },
                              ),
                              ChoiceButton(
                                color: theme.primaryColor,
                                icon: Icons.watch_later,
                                onTap: () {},
                              ),
                            ],
                          );
                        } else {
                          return const Text('Something went wrong.');
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}, ${user.age}',
                  style: theme.textTheme.headline1,
                ),
                Text(
                  user.jobTitle,
                  style: theme.textTheme.headline3!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 15),
                Text(
                  'About',
                  style: theme.textTheme.headline2,
                ),
                Text(
                  user.bio,
                  style: theme.textTheme.headline6!.copyWith(height: 2),
                ),
                const SizedBox(height: 15),
                Text(
                  'Interest',
                  style: theme.textTheme.headline2,
                ),
                Row(
                  children: user.interests
                      .map(
                        (interest) => Container(
                          padding: const EdgeInsets.all(5.0),
                          margin: const EdgeInsets.only(top: 5.0, right: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: LinearGradient(colors: [
                              theme.primaryColor,
                              theme.accentColor,
                            ]),
                          ),
                          child: Text(
                            interest,
                            style: theme.textTheme.headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
