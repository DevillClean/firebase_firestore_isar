import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';


class SessionService extends ChangeNotifier {
  static final SessionService instance = SessionService._privateConstructor();
  StreamSubscription<User?>?_subscription;
  User? currentUser;


    SessionService._privateConstructor(){
      _initialize();
    }

    factory SessionService.init(){
      return instance;
    }

    void _initialize() {
      listenForSession();
    }

    void listenForSession(){
      _subscription = FirebaseAuth.instance.authStateChanges().listen((User? user) {
        currentUser = user;

        notifyListeners();
      });
    } 

    @override
    void dispose() {
      _subscription?.cancel();
      super.dispose();
    }

}


