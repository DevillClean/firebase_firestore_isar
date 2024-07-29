import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/settings_screen/widgets/settings_button.dart';
import 'package:flutter_application_2/theme/styles.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgk,
        title: const Text(
          'Settings',
          style: bodyTextStyle,
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                SettingsButton(),
              ],
            ),
          ),
        ],
       ),
      ),
    );
  }
}
