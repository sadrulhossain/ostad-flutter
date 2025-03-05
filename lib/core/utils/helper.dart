import 'package:flutter/material.dart';

class Helper {
  /// show snack bar message
  /// param String message
  static showSnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: message)
    );
  }
}