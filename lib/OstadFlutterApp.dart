import 'package:flutter/material.dart';
import 'Activities/HomeActivity.dart';
import '../Assets/CustomColors.dart';

class OstadFlutterApp extends StatelessWidget{
  const OstadFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: CustomColors.ochre
      ),
      darkTheme: ThemeData(primarySwatch: Colors.blueGrey),
      color: Colors.blue,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}