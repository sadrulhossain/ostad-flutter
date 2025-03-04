import 'package:flutter/material.dart';

class ElevatedButtonDefault extends StatelessWidget{
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final Color color;

  const ElevatedButtonDefault({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor = Colors.deepPurple,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          )
      ),
      child: Text(label, style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      )),
    );
  }

}