part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class EnterLoginEvent extends LoginEvent{
  final String email;
  final String password;

  EnterLoginEvent({required this.email, required this.password});
}
