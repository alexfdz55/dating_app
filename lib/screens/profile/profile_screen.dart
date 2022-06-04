import 'package:dating_app/models/models.dart';
import 'package:dating_app/widgets/custom_appbar.dart';
import 'package:dating_app/widgets/custom_text_container.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) {
          return ProfileScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final size = MediaQuery.of(context).size;
    final User user = User.users[0];

    return Scaffold(
      appBar: const CustomAppbar(title: 'PROFILE'),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.imageUrls[0]),
                  ),
                ),
              ),
              Container(
                height: size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      theme.primaryColor.withOpacity(0.1),
                      theme.primaryColor.withOpacity(0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      user.name,
                      style: theme.textTheme.headline1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithIcon(title: 'Biography', icon: Icons.edit),
                Text(
                  user.bio,
                  style: textTheme.bodyText1!.copyWith(height: 1.5),
                ),
                const TitleWithIcon(title: 'Pictures', icon: Icons.edit),
                SizedBox(
                  height: 125,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        height: 125,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: theme.primaryColor),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(user.imageUrls[0]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const TitleWithIcon(title: 'Location', icon: Icons.edit),
                Text(
                  'New York, EEUU',
                  style: textTheme.bodyText1!.copyWith(height: 1.5),
                ),
                const TitleWithIcon(title: 'Interest', icon: Icons.edit),
                Row(
                  children: [
                    CustomTextContainer(text: 'MUSIC'),
                    CustomTextContainer(text: 'ECONOMICS'),
                    CustomTextContainer(text: 'FOOTBALL'),
                  ],
                )
              ],
            ),
          )
        ],
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
