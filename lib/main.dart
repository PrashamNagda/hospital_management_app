import 'package:flutter/material.dart';
import 'package:hospital_management_app/screens/choose_category_screen.dart';
import 'login/login_page.dart';
import 'signup/signup_page.dart';

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/chooseCategory': (context) => ChooseCategoryScreen(),
      },
    );
  }
}
