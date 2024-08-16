import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/bloc/bmi_bloc.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/widgets/bmi_button.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/widgets/bmi_gender.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/widgets/bmi_menu_buttons.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/widgets/cards.dart';
import 'package:flutter_application_2/theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BmiCalculatorApp extends StatefulWidget {
  const BmiCalculatorApp({super.key});

  @override
  State<StatefulWidget> createState() => BmiCalculatorAppState();
}

class BmiCalculatorAppState extends State<BmiCalculatorApp> {
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<BmiBloc, BmiState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: bgk,
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: _onLoginPressed,
                child: const Text('Login'),
              ),
            ],
          ),
          body: Column(
            children: [
              const MenuButton(),
              Text(state.bmiResult.toStringAsFixed(2)),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Cards(
                        color: state.gender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        callback: () {
                          setState(
                            () {
                              context
                              .read<BmiBloc>()
                              .add(OnGenderChange(gender: Gender.male));
                            },
                          );
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.mars, size: 90),
                            SizedBox(height: 5),
                            Text(
                              'MALE',
                              style: bodyTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Cards(
                        color: state.gender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        callback: () {
                          setState(() {
                            context
                                .read<BmiBloc>()
                                .add(OnGenderChange(gender: Gender.female));
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.venus, size: 90),
                            SizedBox(height: 5),
                            Text(
                              'FEMALE',
                              style: bodyTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Cards(
                  callback: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: Cards(
                            callback: () {},
                            child: Column(
                              children: [
                                const SizedBox(height: 3),
                                const Text('HEIGHT', style: bodyTextStyle),
                                Text(state.height.toString(),
                                    style: numberTextStyle),
                                Slider(
                                  min: 40,
                                  max: 220,
                                  activeColor: bottomContainerColor,
                                  value: state.height.toDouble(),
                                  onChanged: (value) {
                                    context.read<BmiBloc>().add(
                                        OnHeightChange(height: value.toInt()));
                                  },
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Cards(
                        callback: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: bodyTextStyle,
                            ),
                            Text('${state.weight}', style: numberTextStyle),
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: 160,
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context.read<BmiBloc>().add(
                                          OnWeightChange(
                                              weight: state.weight - 1));
                                    },
                                    icon: const Icon(FontAwesomeIcons.minus),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context.read<BmiBloc>().add(
                                          OnWeightChange(
                                              weight: state.weight + 1));
                                    },
                                    icon: const Icon(FontAwesomeIcons.plus),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Cards(
                        callback: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: bodyTextStyle,
                            ),
                            Text('${state.age}', style: numberTextStyle),
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: 160,
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<BmiBloc>()
                                          .add(OnAgeChange(age: state.age - 1));
                                    },
                                    icon: const Icon(FontAwesomeIcons.minus),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        context.read<BmiBloc>().add(
                                            OnAgeChange(age: state.age + 1));
                                      },
                                      icon: const Icon(FontAwesomeIcons.plus)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const BmiButton(),
              const SizedBox(height: 5),
            ],
          ),
        );
      },
    );
  }


  void _onLoginPressed() async {
   final isLoggedIn = await context.push('/login') as bool?;
   if(isLoggedIn != null && isLoggedIn){
     // ignore: use_build_context_synchronously
     context.read<BmiBloc>().add(Initialize());
   }
  }
}
