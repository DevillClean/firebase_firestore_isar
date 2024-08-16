import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({
    super.key,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  final user = FirebaseAuth.instance.currentUser;

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.go('/Settings');
          },
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        const Text('BMI CALCULATOR'),
        const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text('${user.email}'),
              SignOutButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          await FirebaseAuth.instance.signOut();
          if (context.mounted) {
            GoRouter.of(context).goNamed('home');
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка выхода: $e')),
            );
          }
        }
      },
      child: const Text('Выйти'),
    );
  }
}
