import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: const ButtonStyle(),
      onPressed: () {
        context.go('/');
      },
      icon: const Icon(FontAwesomeIcons.arrowLeft),
      label: const Text('Back'),
    );
  }
}
