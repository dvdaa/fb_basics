import 'package:aa_fb_basics/login_service.dart';
import 'package:aa_fb_basics/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final FirebaseAuth auth = FirebaseAuth.instance;

  final LoginService loginService = LoginService(auth: auth);

  runApp(MainApp(loginService: loginService));
}

class MainApp extends StatelessWidget {
  final LoginService loginService;

  const MainApp({super.key, required this.loginService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(loginService: loginService),
    );
  }
}
