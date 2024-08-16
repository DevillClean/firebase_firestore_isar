import 'package:flutter_application_2/data/model/bmi_data.dart';
import 'package:flutter_application_2/data/model/localdb_model.dart';

class MapFirebaseToBmiData {
  List<BmiData> mapListToBmiData(List<BmiData> models) {
    if(models.isNotEmpty){
      return models.map((model) => BmiData(
        weight: model.weight,
        height: model.height,
        age: model.age,
        bmiResult: model.bmiResult, 
        id: 'id',
      )).toList();
    } else {
      throw Exception('The input list is empty');
    }
  }
}

class MapLocalDbToBmiData {
  List<DbModel> mapListFromDbModel(List<DbModel> input) {
    if (input.isNotEmpty) {
      return input.map((input) => DbModel(
        weight: input.weight,
        height: input.height,
        age: input.age,
        totalBmi: input.totalBmi
      )).toList();
    } else {
      throw Exception('The input list is empty');
    }
  }
}
