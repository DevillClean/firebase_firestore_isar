class LocalData {
  final int height;
  final int weight;
  final int age;
  final int bmiResult;

  LocalData({required this.age, required this.height, required this.weight, required this.bmiResult});

  factory LocalData.fromMap(Map<String, dynamic> map) {
    return LocalData(
      bmiResult: map['bmi'] as int,
      age: map['category'] as int,
      height: map['height'] as int,
      weight: map['weight'] as int
    );
  }
}
