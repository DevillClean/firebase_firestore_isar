import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void>login({ required String password, required String login}) async {
    await auth.signInWithEmailAndPassword(
      email: login, 
      password: password
    );
  }
}