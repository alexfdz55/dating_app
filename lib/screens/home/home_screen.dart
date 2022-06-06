import 'package:dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return const HomeScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CustomAppbar(title: 'DISCOVER'),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          final swipeBloc = BlocProvider.of<SwipeBloc>(context);

          if (state is SwipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SwipeLoaded) {
            return Column(
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.pushNamed(
                      context,
                      '/users',
                      arguments: state.users[0],
                    );
                  },
                  child: Draggable(
                    feedback: UserCard(user: state.users[0]),
                    childWhenDragging: UserCard(user: state.users[1]),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        swipeBloc.add(SwipeLeft(user: state.users[0]));
                      } else {
                        swipeBloc.add(SwipeLeft(user: state.users[0]));
                      }
                    },
                    child: UserCard(user: state.users[0]),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChoiceButton(
                        color: theme.accentColor,
                        icon: Icons.clear_rounded,
                        onTap: () =>
                            swipeBloc.add(SwipeLeft(user: state.users[0])),
                      ),
                      ChoiceButton(
                        height: 80,
                        width: 80,
                        size: 30,
                        color: Colors.white,
                        hasGradient: true,
                        icon: Icons.favorite,
                        onTap: () =>
                            swipeBloc.add(SwipeRight(user: state.users[0])),
                      ),
                      ChoiceButton(
                        color: theme.primaryColor,
                        icon: Icons.watch_later,
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          if (state is SwipeError) {
            return const Text('Something went wrong');
          }
          return Container();
        },
      ),
    );
  }
}
