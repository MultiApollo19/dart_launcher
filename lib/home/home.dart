import 'package:flutter/material.dart';
import 'package:quizapp/login/login.dart';
import 'package:quizapp/shared/shared.dart';
import 'package:quizapp/topics/topics.dart';
import 'package:quizapp/services/auth.dart';
import 'dart:developer' as developer;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
