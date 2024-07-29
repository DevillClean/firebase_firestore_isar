import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/styles.dart';

class Cards extends StatelessWidget {
  final VoidCallback callback;
  final Color color;
  final Widget child;

  const Cards(
      {super.key,
      this.color = inactiveCardColor,
      required this.child,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: child,
      ),
    );
  }
}