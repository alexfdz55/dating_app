import 'package:dating_app/models/user_model.dart';
import 'package:dating_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'user_image_small.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Hero(
      tag: 'user_image',
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: SizedBox(
          height: size.height / 1.4,
          width: size.width,
          child: Stack(
            children: [
              UserImage.large(
                url: user.imageUrls[0],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: NetworkImage(user.imageUrls[0]),
              //       ),
              //       borderRadius: BorderRadius.circular(5.0),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey.withOpacity(0.5),
              //           spreadRadius: 4,
              //           blurRadius: 4,
              //           offset: const Offset(3, 3),
              //         )
              //       ]),
              // ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}, ${user.age}',
                      style: textTheme.headline2!.copyWith(color: Colors.white),
                    ),
                    Text(
                      user.jobTitle,
                      style: textTheme.headline3!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: user.imageUrls.length + 1,
                        itemBuilder: (_, index) {
                          return (index < user.imageUrls.length)
                              ? UserImage.small(
                                  url: user.imageUrls[index],
                                  margin:
                                      const EdgeInsets.only(top: 8, right: 8),
                                )
                              : Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.info_outline,
                                    size: 25,
                                    color: theme.primaryColor,
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
