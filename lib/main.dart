import 'package:flutter/material.dart';
import 'screens/choose_category_screen.dart';

void main() {
  runApp(HospitalManagementApp());
}

class HospitalManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChooseCategoryScreen(),
    );
  }
}
