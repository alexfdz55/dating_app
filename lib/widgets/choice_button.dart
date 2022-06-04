import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;
  final VoidCallback onTap;

  const ChoiceButton(
      {Key? key,
      this.width = 60,
      this.height = 60,
      this.size = 25,
      required this.color,
      required this.icon,
      this.hasGradient = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          gradient: hasGradient
              ? LinearGradient(colors: [
                  theme.primaryColor,
                  theme.accentColor,
                ])
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 4,
              blurRadius: 4,
              offset: const Offset(3, 3),
            )
          ],
        ),
        child: Icon(icon, color: color, size: size),
      ),
    );
  }
}
