import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/data/repository/calculator_data_repository.dart';
import 'package:flutter_application_2/presentation/screens/bmi_screen/widgets/bmi_gender.dart';

part 'bmi_event.dart';

part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  final _bmiDataRepository = CalculatorDataRepository();

  BmiBloc() : super(BmiState.initial()) {
    on<OnGenderChange>((event, emit) => onGenderChange(event, emit));
    on<OnHeightChange>((event, emit) => onHeightChange(event, emit));
    on<OnWeightChange>((event, emit) => onWeightChange(event, emit));
    on<OnAgeChange>((event, emit) => onAgeChange(event, emit));
    on<OnCalculateBmi>((event, emit) => onCalculateBmi(event, emit));
    on<Initialize>((event, emit) => _onInitialize(event, emit));
    add(Initialize());
  }

void _onInitialize(Initialize event, Emitter<BmiState> emit) async {
  try {
    final bmiDataList = await _bmiDataRepository.getCalculatorData();
    if (bmiDataList.isNotEmpty) {
      final data = bmiDataList.first;
      emit(state.copyWith(
        height: data.height,
        weight: data.weight,
        age: data.age,
        bmiResult: data.bmiResult,
      ));
    } else {
      emit(_getDefaultBmiState());
    }
  } catch (e) {
    emit(_getDefaultBmiState());
  }
}

BmiState _getDefaultBmiState() {
  return state.copyWith(
    height: 40,
    weight: 40,
    age: 10,
    bmiResult: 0,
  );
}

  void onGenderChange(OnGenderChange event, Emitter<BmiState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  onWeightChange(OnWeightChange event, Emitter<BmiState> emit) {
    if (event.weight != 0) {
      emit(state.copyWith(weight: event.weight));
    }
  }

  onHeightChange(OnHeightChange event, Emitter<BmiState> emit) {
    emit(state.copyWith(height: event.height));
  }

  onAgeChange(OnAgeChange event, Emitter<BmiState> emit) {
    if (event.age != 0) {
      emit(state.copyWith(age: event.age));
    }
  }

  onCalculateBmi(OnCalculateBmi event, Emitter<BmiState> emit) {
    final bmiResult = state.weight / pow(state.height / 100, 2);
    emit(state.copyWith(
      bmiResult: bmiResult.toInt(),
      isBmiCalculated: state.bmiResult != 0.0,
    ));
    if (bmiResult > 25) {
      emit(state.copyWith(
        isBmiCalculated: true,
      ));
    } else if (bmiResult > 18.5) {
      emit(state.copyWith(
        isBmiCalculated: true,
      ));
    } else {
      emit(state.copyWith(
        isBmiCalculated: true,
      ));
    }
  }
}
