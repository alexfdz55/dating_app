import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  const CustomButton({
    Key? key,
    required this.tabController,
    this.text = 'START',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: LinearGradient(colors: [
            theme.primaryColor,
            theme.accentColor,
          ])),
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(elevation: 0, primary: Colors.transparent),
        onPressed: () {
          tabController.animateTo(tabController.index + 1);
        },
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: theme.textTheme.headline4!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
