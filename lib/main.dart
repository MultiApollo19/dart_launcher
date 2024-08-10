import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:quizapp/routes.dart';
import 'package:quizapp/theme.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // This widget is the root of your application.
  final Future<FirebaseApp> _FireInit =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _FireInit,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('Error ${snapshot.error}',
                    textDirection: TextDirection.ltr));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              routes: appRoutes,
              theme: appTheme,
            );
          }
          return Center(
              child: Text('loading', textDirection: TextDirection.ltr));
        });
  }
}
