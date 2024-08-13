import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, this.message = "Something is broken."});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(message, textScaler: const TextScaler.linear(0.5)));
  }
}
