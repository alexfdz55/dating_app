import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasAction;
  const CustomAppbar({Key? key, required this.title, this.hasAction = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(child: SvgPicture.asset('assets/logo.svg', height: 50)),
          Expanded(
            flex: 2,
            child: Text(title, style: theme.textTheme.headline2),
          ),
        ],
      ),
      actions: hasAction
          ? [
              IconButton(
                  icon: Icon(Icons.message, color: theme.primaryColor),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.person, color: theme.primaryColor),
                  onPressed: () {}),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
