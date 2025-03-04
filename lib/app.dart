import 'package:flutter/material.dart';
import 'package:ostad_flutter/core/utils/lang/en/label.dart';
import 'package:ostad_flutter/presentation/screens/product_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Label.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}