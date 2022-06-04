import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final TabController tabController;
  const CustomImageContainer({Key? key, required this.tabController})
      : super(key: key);

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
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          icon: Icon(Icons.add_circle, color: theme.accentColor),
          onPressed: () {},
        ),
      ),
    );
  }
}
