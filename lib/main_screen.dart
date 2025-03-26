import 'package:aa_fb_basics/home_screen.dart';
import 'package:aa_fb_basics/login_screen.dart';
import 'package:aa_fb_basics/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final LoginService loginService;

  const MainScreen({super.key, required this.loginService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: loginService.onAuthStateChanged,
        builder: (context, snapshot) {
          // If logged in
          if (snapshot.hasData) {
            // show HomeScreen,
            return HomeScreen(loginService: loginService);
            // if not logged in
          } else {
            // show Login
            return LoginScreen(loginService: loginService);
          }
        },
      ),
    );
  }
}
