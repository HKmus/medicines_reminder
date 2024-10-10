import 'package:flutter/material.dart';
import 'package:medicines_reminder/core/app_theme.dart';
import 'package:medicines_reminder/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicines Reminder App',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
