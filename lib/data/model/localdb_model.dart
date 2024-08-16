import 'package:isar/isar.dart';

part 'localdb_model.g.dart';

@Collection()
class DbModel {
  Id id = Isar.autoIncrement;
  late int height;
  late int weight;
  late int age;
  late int totalBmi;

  DbModel({required this.age, required this.height, required this.weight, required this.totalBmi});
}
