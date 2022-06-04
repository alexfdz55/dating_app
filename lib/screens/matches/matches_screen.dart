import 'package:dating_app/models/user_match_model.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  static const String routeName = '/matches';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => MatchesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final inactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();

    final activeMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();

    print(inactiveMatches.length);

    return Scaffold(
      appBar: const CustomAppbar(title: 'MATCHES'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Likes', style: textTheme.headline4),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: inactiveMatches.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      UserImageSmall(
                        height: 70,
                        width: 70,
                        imageUrl:
                            inactiveMatches[index].matchedUser.imageUrls[0],
                      ),
                      Text(inactiveMatches[index].matchedUser.name,
                          style: textTheme.headline5)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('Your Chats', style: textTheme.headline4),
              ListView.builder(
                shrinkWrap: true,
                itemCount: activeMatches.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.pushNamed(context, '/chat',
                      arguments: activeMatches[index]),
                  child: Row(
                    children: [
                      UserImageSmall(
                        height: 70,
                        width: 70,
                        imageUrl: activeMatches[index].matchedUser.imageUrls[0],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activeMatches[index].matchedUser.name,
                            style: textTheme.headline5,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            activeMatches[index].chat![0].messages[0].message,
                            style: textTheme.headline6,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            activeMatches[index]
                                .chat![0]
                                .messages[0]
                                .timeString,
                            style: textTheme.bodyText1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
