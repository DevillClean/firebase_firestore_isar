import 'package:flutter_application_2/data/database/fiestore_db_provider.dart';
import 'package:flutter_application_2/data/mapper/bmi_data_mapper.dart';
import 'package:flutter_application_2/data/model/bmi_data.dart';
import 'package:flutter_application_2/data/model/combined_data.dart';
import 'package:flutter_application_2/data/model/localdb_model.dart';
import 'package:flutter_application_2/data/provider/local_db_provider.dart';
import 'package:flutter_application_2/data/service/session_service.dart';

class CalculatorDataRepository {
  final _localDbProvider = LocalDbProvider();
  final _fireStoreDbProvider = FireStoreDbProvider();
  final _mapFirestoreObjectToBmiData = MapFirebaseToBmiData();
  final _mapLocalDbToBmiData = MapLocalDbToBmiData();


  Future<void> saveCalculatorData(CombinedData data) async {
    try {
      if (SessionService.instance.currentUser != null) {
        if (data.bmiData.isNotEmpty) {
          for (BmiData bmiData in data.bmiData) {
            await _fireStoreDbProvider.writeToDb(bmiData);
          }
        } else {
          throw Exception('Нет данных BmiData для сохранения');
        }
      } else {
        if (data.dbModel.isNotEmpty) {
          for (DbModel dbModel in data.dbModel) {
            await _localDbProvider.writeToDb(dbModel);
          }
        } else {
          throw Exception('Нет данных DbModel для сохранения');
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('Ошибка при сохранении данных калькулятора: $e');
      throw Exception('Не удалось сохранить данные калькулятора');
    }
  }


  Future<CombinedData> getCalculatorData() async {
    try {
      if (SessionService.instance.currentUser != null) {
        final dataFromFirestore = await _fireStoreDbProvider.readFromDb();
        final bmiData =
            _mapFirestoreObjectToBmiData.mapListToBmiData(dataFromFirestore);
        // ignore: avoid_print
        print(bmiData);
        return CombinedData(bmiData: bmiData, dbModel: []);
      } else {
        final localDataList = await _localDbProvider.readFromDb();
        final dbModel = _mapLocalDbToBmiData.mapListFromDbModel(localDataList);
        return CombinedData(bmiData: [], dbModel: dbModel);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching calculator data: $e');
      throw Exception('Failed to fetch calculator data');
    }
  }
}

