import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // This was generated for you
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        primaryColor: const Color(0xFF2D8C8C),
        scaffoldBackgroundColor: const Color(0xFFFFF8F1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2D8C8C),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardColor: const Color(0xFFF5F5F5),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF333333)),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFFFA726), // Accent
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
