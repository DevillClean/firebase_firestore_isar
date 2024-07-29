import 'package:flutter_application_2/data/database/fiestore_db_provider.dart';
import 'package:flutter_application_2/data/provider/local_db_provider.dart';
import 'package:flutter_application_2/data/model/bmi_data.dart';
import 'package:flutter_application_2/data/service/session_service.dart';
import 'package:flutter_application_2/data/model/localdb_model.dart';

class CalculatorDataRepository {
  final _localDbProvider = LocalDbProvider();
  final _fireStoreDbProvider = FireStoreDbProvider();
  // final _mapFirestoreObjectToBmiData = MapFirebaseToBmiData();
  // final _mapLocalDbToBmiData = MapLocalDbToBmiData();


  Future<void> saveCalculatorData(DbModel model) {
    if (SessionService.instance.currentUser != null) {
    return  _fireStoreDbProvider.writeToDb(model);
    } else {
     return _localDbProvider.writeToDb(model);
    }
  }

  Future<List<DbModel>> readFromDb() async {
    return []; 
}

  Future<List<BmiData>> getCalculatorData() async {
      List<DbModel> data;
    if (SessionService.instance.currentUser != null) {
        data = await _fireStoreDbProvider.readFromDb();
    } else {
        data = await _localDbProvider.readFromDb();
      } 
       if(data.isNotEmpty) {
        return convertDbModelBmiData(data);
       } else {
        throw Exception('No data found');
       }
      } 
    // } else {
    //   final data = await  _localDbProvider.readFromDb();
    //     if(data != null && data.isNotEmpty){
    //       return convertDbModelBmiData(data);
    //     } else {
    //       throw Exception('No data found is local database');
    //     }
    // }
  }

  List<BmiData> convertDbModelBmiData(List<DbModel> dbModels){
    return dbModels.map((dbModel) => BmiData(
      dbModel.age, 
      dbModel.height, 
      dbModel.weight, 
      dbModel.totalBmi
    )).toList();
  }

