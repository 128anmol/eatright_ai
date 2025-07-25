import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'signup_screen.dart';
import 'personal_details_screen.dart';

class LoginScreen extends StatelessWidget {
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

  Future<void> _login(BuildContext context) async {
    try {
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await saveUserProfile(cred.user!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => PersonalDetailsScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: \n${e.toString()}')),
      );
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final cred = await FirebaseAuth.instance.signInWithCredential(credential);
      await saveUserProfile(cred.user!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => PersonalDetailsScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google login failed: $e')),
      );
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final cred = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
        await saveUserProfile(cred.user!);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => PersonalDetailsScreen()),
        );
      } else {
        throw Exception(result.message);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Facebook login failed: $e')),
      );
    }
  }

  // Apple login placeholder (works only on iOS/macOS)
  Future<void> signInWithApple(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Apple login is only available on iOS/macOS.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
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
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            Text('Or login with'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.g_mobiledata),
                  onPressed: () => signInWithGoogle(context),
                ),
                IconButton(
                  icon: Icon(Icons.apple),
                  onPressed: () => signInWithApple(context),
                ),
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () => signInWithFacebook(context),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignupScreen()),
                );
              },
              child: Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
} 