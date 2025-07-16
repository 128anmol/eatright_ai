import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const EatRightApp());
}

class EatRightApp extends StatelessWidget {
  const EatRightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EatRight AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(
          0xFFFFF8F1,
        ), // light peachy background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF333333)),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
