import 'package:aa_fb_basics/login_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final LoginService loginService;

  const LoginScreen({super.key, required this.loginService});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email and password.")),
      );
      return;
    }

    await widget.loginService.loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() {});
  }

  void signUpUser() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email and password.")),
      );
      return;
    }

    await widget.loginService.signUpUser(
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() {});
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 64.0),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 32),
          FilledButton(onPressed: loginUser, child: Text("Login"),),
          const SizedBox(height: 32),
          FilledButton(onPressed: signUpUser, child: Text("Register"),),
        ],
      ),
    );
  }
}
