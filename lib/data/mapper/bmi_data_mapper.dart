import 'package:flutter_application_2/data/model/bmi_data.dart';
import 'package:flutter_application_2/data/model/localdb_model.dart';

class MapFirebaseToBmiData {
  BmiData map(List<BmiData> models) {
    if(models.isNotEmpty){
      final model = models.first;
      return BmiData(
        model.weight,
        model.height,
        model.age,
        model.bmiResult,
      );
    } else {
      throw Exception('The input list is empty');
    }
  }
}

class MapLocalDbToBmiData {
  BmiData map(DbModel input) {
    return BmiData(
      input.weight,
      input.height,
      input.age,
      input.totalBmi,
    );
  }
}
