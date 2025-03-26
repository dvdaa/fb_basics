import 'package:aa_fb_basics/login_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final LoginService loginService;

  const HomeScreen({super.key, required this.loginService});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: loginService.logoutUser,
        child: Text("Log out"),
      ),
    );
  }
}
