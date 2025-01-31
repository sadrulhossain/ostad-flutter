import 'package:flutter/material.dart';
import 'Activities/HomeActivity.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App', // app title
      debugShowCheckedModeBanner: false, // remove debug tag
      home: HomeActivity()
    );
  }
  
}