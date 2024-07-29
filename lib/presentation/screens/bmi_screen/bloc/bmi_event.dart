part of 'bmi_bloc.dart';

abstract class BmiEvent {}


class Initialize extends BmiEvent {

  Initialize();
}
class OnGenderChange extends BmiEvent {
  final Gender gender;
  OnGenderChange({required this.gender});
}

class OnHeightChange extends BmiEvent {
  final int height;
  OnHeightChange({required this.height});
}

class OnWeightChange extends BmiEvent {
  final int weight;
  OnWeightChange({required this.weight});
}

class OnAgeChange extends BmiEvent {
  final int age;
  OnAgeChange({required this.age});
}

class OnCalculateBmi extends BmiEvent {}