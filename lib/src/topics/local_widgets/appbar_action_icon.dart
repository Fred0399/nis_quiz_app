import 'package:flutter/material.dart';

class AppBarActionIcon extends StatelessWidget {
  final IconData? icon;
  final Function()? onPressed;
  const AppBarActionIcon(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      padding: EdgeInsets.zero,
    );
  }
}
