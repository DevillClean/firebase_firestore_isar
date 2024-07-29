part of 'login_bloc.dart';


@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {
  final String errorText;

  LoginError({required this.errorText});
}

class LoginSucces extends LoginState {}
