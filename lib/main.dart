import 'package:flutter/material.dart';
import 'package:rental_app/screens/home_screen.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rental App',
      theme: ThemeData.light(), // Default theme
      home: HomeScreen(), // Home Screen
    );
  }
}
