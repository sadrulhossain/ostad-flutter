import 'package:flutter/material.dart';

class RoundFloatingActionButton extends StatelessWidget{
  final VoidCallback onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color color;

  const RoundFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = Colors.deepPurple,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      elevation: 10,
      backgroundColor: backgroundColor,
      shape: CircleBorder(),
      child: Icon(icon, color: color),

    );
  }

}