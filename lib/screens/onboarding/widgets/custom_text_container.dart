import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomTextContainer(
      {Key? key, required this.tabController, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 30,
      margin: const EdgeInsets.only(top: 10, right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: LinearGradient(
          colors: [
            theme.primaryColor,
            theme.accentColor,
          ],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: theme.textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
