import 'package:isar/isar.dart';

part 'localdb_model.g.dart';

@Collection()
class DbModel {
  Id id = Isar.autoIncrement;
  late int height;
  late int weight;
  late int age;
  late int totalBmi;

  DbModel(this.age, this.height, this.weight, this.totalBmi);
}