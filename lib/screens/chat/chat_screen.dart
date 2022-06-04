import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final UserMatch userMatch;
  const ChatScreen({Key? key, required this.userMatch}) : super(key: key);
  static const String routeName = '/chat';

  static Route route({required UserMatch userMatch}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ChatScreen(userMatch: userMatch),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: theme.primaryColor),
          centerTitle: true,
          title: Column(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage:
                    NetworkImage(userMatch.matchedUser.imageUrls[0]),
              ),
              Text(
                userMatch.matchedUser.name,
                style: theme.textTheme.headline4,
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: userMatch.chat != null
                    ? Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userMatch.chat![0].messages.length,
                          itemBuilder: (_, index) => ListTile(
                            title: userMatch
                                        .chat![0].messages[index].senderId ==
                                    1
                                ? Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: theme.backgroundColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      child: Text(
                                        userMatch
                                            .chat![0].messages[index].message,
                                        style: theme.textTheme.headline6,
                                      ),
                                    ),
                                  )
                                : Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(
                                              userMatch
                                                  .matchedUser.imageUrls[0]),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: theme.primaryColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8.0)),
                                          ),
                                          child: Text(
                                            userMatch.chat![0].messages[index]
                                                .message,
                                            style: theme.textTheme.headline6!
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 100,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.primaryColor,
                    ),
                    child: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.send_outlined),
                        onPressed: () {}),
                  ),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Type here...',
                      contentPadding:
                          EdgeInsets.only(left: 20, bottom: 5, top: 5),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ))
                ],
              ),
            )
          ],
        ));
  }
}
