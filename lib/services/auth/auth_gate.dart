import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zuzu/pages/second_screen.dart';
import 'package:zuzu/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        //User is logged in
        if (snapshot.hasData) {
          return const SecondScreen();
        }

        //User is not logged in
        else {
          return LoginOrRegister(showLoginPage: true);
        }
      }),
    );
  }
}
