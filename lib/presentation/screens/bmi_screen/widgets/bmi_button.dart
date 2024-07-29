import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/bloc/bmi_bloc.dart';
import 'package:flutter_application_2/theme/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiButton extends StatelessWidget {
  const BmiButton({super.key,});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 7, 37, 61),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: appText(context, 'BMI', 18, Colors.white),
        ),
        onPressed: () {
           context.read<BmiBloc>().add(OnCalculateBmi());
        },
      ),
    );
  }
}