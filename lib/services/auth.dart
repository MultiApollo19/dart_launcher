import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'dart:convert';
//import 'dart:math';
//import 'package:crypto/crypto.dart';
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  /*String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }*/

  //Anonymous Firebase login
  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      //handle error
    }
  }

  //LogOut
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //Google auth
  Future<void> googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      //handle error
    }
  }

  /*Future<void> appleLogin() async {
    AppleAuthProvider appleProvider = AppleAuthProvider();
    appleProvider = appleProvider.addScope('email');
    appleProvider = appleProvider.addScope('name');
// the line below will start the Apple sign in flow for your platform
    final credential =
        await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }*/
}
