
class BmiData {
  final String id;
  final int height;
  final int weight;
  final int age;
  final int bmiResult;

  BmiData({required this.id ,required this.age, required this.height, required this.weight, required this.bmiResult});

  factory BmiData.fromMap(Map<String, dynamic> map) {
    return BmiData(
      id: map['id'] as String,
      bmiResult: map['bmiResult'] as int,
      age: map['age'] as int,
      height: map['height'] as int,
      weight: map['weight'] as int
    );
  }
}
