import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/model/localdb_model.dart';
import 'package:flutter_application_2/presentation/screens/auth_screen/login_bloc/login_bloc.dart';
import 'package:flutter_application_2/presentation/screens/auth_screen/widgets/custom_button.dart';
import 'package:flutter_application_2/presentation/screens/auth_screen/widgets/custom_text_field.dart';
import 'package:flutter_application_2/theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Isar? isar;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Логин',
                  style: tStyleFont,
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: loginController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Пароль',
                  style: tStyleFont,
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSucces) {
                      context.pop(true);
                    }
                    if (state is LoginError) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                            state.errorText,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    }
                  },
                  child: MyButton(
                    onTap: () {
                      BlocProvider.of<LoginBloc>(context).add(
                        EnterLoginEvent(
                            email: loginController.text,
                            password: passwordController.text),
                      );
                    },
                    name: 'Sign in',
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(
                  onTap: () async {
                    try {
                      final directory =
                          await getApplicationDocumentsDirectory();
                      isar = await Isar.open([DbModelSchema],
                          directory: directory.path);
                      await writeToDb(isar!);
                       // ignore: use_build_context_synchronously
                       Navigator.pushNamed(context, 'home');
                    } catch (e) {
                      // ignore: avoid_print
                      print('Ошибка: $e');
                    }
                  },
                  name: 'Login as guest',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> writeToDb(Isar isar) async {
    final dbModel = DbModel(
      age: 10,
      height: 40,
      weight: 50,
      totalBmi: 0,
    );
    await isar.writeTxn(() async {
      await isar.dbModels.put(dbModel);
    });
  }
}
