import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/data/repository/login_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<EnterLoginEvent>((event, emit) async {
      try {
        await repository.login(login: event.email, password: event.password);
        emit(LoginSucces());
      } catch (e){
        emit(LoginError(
          errorText: e.toString()
          ),
        );
      }
    });
  }
  final LoginRepository repository;
}
