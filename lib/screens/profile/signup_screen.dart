import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'personal_details_screen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> saveUserProfile(User user, {String? name}) async {
    final doc = FirebaseFirestore.instance.collection('users').doc(user.uid);
    await doc.set({
      'uid': user.uid,
      'email': user.email,
      'name': name ?? user.displayName,
      'photoURL': user.photoURL,
      'lastLogin': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _signup() async {
      try {
        final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        await FirebaseAuth.instance.currentUser?.updateDisplayName(nameController.text.trim());
        await saveUserProfile(cred.user!, name: nameController.text.trim());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => PersonalDetailsScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup failed: \n${e.toString()}')),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {}, // TODO: Add image picker
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.camera_alt, size: 32, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _signup,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 