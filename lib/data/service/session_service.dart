import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/bmi_calculator_screen.dart';

class SessionService extends ChangeNotifier {
  static final SessionService instance = SessionService._privateConstructor();
  late StreamSubscription<User?> _subscription;
  User? currentUser;

  SessionService._privateConstructor() {
    _initialize();
  }

  factory SessionService.init() {
    return instance;
  }

  void _initialize() {
    listenForSession();
  }

  void listenForSession() {
    _subscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      currentUser = user;
      notifyListeners();
      if (user == null) {
        // ignore: avoid_print
        print('Пользователь вышел из системы');
      } else {
        // ignore: avoid_print
        print('Пользователь вошел: ${user.uid}');
      }
    }, onError: (error) {
      // ignore: avoid_print
      print("Error listening for auth state changes: $error");
    });
  }

  void navigateToBmiCalculator(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BmiCalculatorApp()),
    );
  }

  static bool isLoggedIn() {
    return instance.currentUser != null;
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
