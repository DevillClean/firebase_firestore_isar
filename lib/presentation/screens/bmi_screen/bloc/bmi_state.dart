part of 'bmi_bloc.dart';

class BmiState {
  final int height;
  final int weight;
  final Gender? gender;
  final int age;
  final int bmiResult;
  final bool isBmiCalculated;
  BmiState({
    required this.height,
    required this.weight,
    required this.gender,
    required this.age,
    required this.bmiResult,
    required this.isBmiCalculated,
  });
  factory BmiState.initial() {
    return BmiState(
      height: 40,
      weight: 30,
      gender: null,
      age: 10,
      bmiResult: 0,
      isBmiCalculated: false,
    );
  }
  BmiState copyWith({
    int? height,
    int? weight,
    int? age,
    Gender? gender,
    int? bmiResult,
    String? resultType,
    String? resultMessage,
    bool? isBmiCalculated,
  }) {
    return BmiState(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      bmiResult: bmiResult ?? this.bmiResult,
      isBmiCalculated: isBmiCalculated ?? this.isBmiCalculated,
    );
  }
}
