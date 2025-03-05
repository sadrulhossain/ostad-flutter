import 'package:flutter/material.dart';

class OutlinedRoundBorderIconButton extends StatelessWidget{
  final VoidCallback onPressed;
  final IconData icon;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final Color backgroundColor;
  final Color color;

  const OutlinedRoundBorderIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.paddingHorizontal = 5,
    this.paddingVertical = 5,
    this.borderRadius = 5,
    this.backgroundColor = Colors.white,
    this.color = Colors.deepPurple,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: color,
            )
        ),
      ),
    );
  }
}