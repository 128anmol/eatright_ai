import 'package:flutter/material.dart';
import 'profile/login_screen.dart';
import 'profile/personal_details_screen.dart';

class ProfileScreen extends StatelessWidget {
  // For demo, let's assume user is not logged in
  final bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? PersonalDetailsScreen()
        : LoginScreen();
  }
} 