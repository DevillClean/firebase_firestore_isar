import 'package:flutter_application_2/data/model/bmi_data.dart';
import 'package:flutter_application_2/data/model/localdb_model.dart';

class CombinedData {  
  final List<BmiData> bmiData;  
  final List<DbModel> dbModel;  

  CombinedData({required this.bmiData, required this.dbModel});  
  bool get isNotEmpty => bmiData.isNotEmpty;
  BmiData get firstBmiData => bmiData.first;
} 