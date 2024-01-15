import 'package:flutter/material.dart';
import 'package:zuzu/pages/letsin/login_screen.dart';
import 'package:zuzu/pages/letsin/sign_up_screen.dart';

// ignore: must_be_immutable
class LoginOrRegister extends StatefulWidget {
  LoginOrRegister({super.key, required this.showLoginPage});

  bool showLoginPage;

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show the login screen

  // toggle between login and register page
  void togglePages() {
    setState(() {
      widget.showLoginPage = !widget.showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showLoginPage) {
      return LoginScreen(onTap: togglePages);
    } else {
      return SignupScreen(onTap: togglePages);
    }
  }
}
