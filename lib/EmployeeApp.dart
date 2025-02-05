import 'package:flutter/material.dart';

import 'Activities/AddEmployeeActivity.dart';

class EmployeeApp extends StatelessWidget {
  const EmployeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddEmployeeActivity(),
    );
  }

}