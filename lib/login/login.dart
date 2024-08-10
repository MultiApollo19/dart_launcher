import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            Flexible(
              child: LoginButton(
                  color: Colors.deepPurple,
                  icon: FontAwesomeIcons.userNinja,
                  text: 'Continue as guest',
                  logicMethod: AuthService().anonLogin),
            ),
            Flexible(
              child: LoginButton(
                  color: Colors.deepPurple,
                  icon: FontAwesomeIcons.google,
                  text: 'Login with Google',
                  logicMethod: AuthService().googleLogin),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function logicMethod;

  const LoginButton(
      {Key? key,
      required this.color,
      required this.icon,
      required this.text,
      required this.logicMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton.icon(
          icon: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(24),
            backgroundColor: color,
          ),
          onPressed: () => logicMethod(),
          label: Text(text, textAlign: TextAlign.center),
        ));
  }
}
