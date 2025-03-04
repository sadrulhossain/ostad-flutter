import 'package:flutter/material.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Color backgroundColor;
  final Color color;
  final FontWeight fontWeight;
  final List<Widget>? actions;

  const AppBarDefault({
    super.key,
    required this.title,
    this.backgroundColor = Colors.deepPurple,
    this.color = Colors.white,
    this.fontWeight = FontWeight.bold,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(
        color: color,
        fontWeight: fontWeight,
      )),
      backgroundColor: backgroundColor,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}