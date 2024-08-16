// import 'package:flutter_application_2/data/service/session_service.dart';
import 'package:flutter_application_2/data/repository/login_repository.dart';
import 'package:flutter_application_2/data/service/session_service.dart';
import 'package:flutter_application_2/presentation/screens/auth_screen/login_bloc/login_bloc.dart';
import 'package:flutter_application_2/presentation/screens/auth_screen/login_screen.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/bloc/bmi_bloc.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/bmi_calculator_screen.dart';
import 'package:flutter_application_2/presentation/screens/settings_screen/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;
  final SessionService sessionService = SessionService.init();

  AppRouter._privateConstructor() {
    _initialize();
  }

  factory AppRouter.init() {
    return _instance;
  }

  void _initialize() {
    router = GoRouter(initialLocation: '/home', routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => RepositoryProvider(
          create: (context) => LoginRepository(),
          child: BlocProvider(
            create: (context) => LoginBloc(
                repository: RepositoryProvider.of<LoginRepository>(context)),
            child: const AuthScreen(),
          ),
        ),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => BlocProvider(
          create: (context) => BmiBloc(),
          child: const BmiCalculatorApp(),
        ),
      ),
      GoRoute(
        name: 'settings',
        path: '/settings',
        builder: (context, state) => const Settings(),
      ),
    ]);
  }
}
