import 'package:flutter/material.dart';

class TextFieldDefault extends StatelessWidget{
  final String label;
  final TextEditingController controller;

  const TextFieldDefault({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label
      ),
    );
  }

}