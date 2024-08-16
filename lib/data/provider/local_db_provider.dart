import 'package:flutter_application_2/data/model/localdb_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDbProvider {
  static late Isar? isar;
  List<DbModel> dbList = [];

  static Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([DbModelSchema],
        directory: dir.path, 
        name: 'Local Isar Database'
    );
  }


  Future<void> writeToDb(DbModel model) async {
    try {
      if (isar != null) {
        await isar!.writeTxn(() async {
          await isar!.dbModels.put(model);
        });
        await readFromDb();
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error writing to database $e");
    }
  }

  Future <List<DbModel>> readFromDb() async {
    try {
        dbList = await isar!.dbModels.where().findAll(); 
      if (dbList.isEmpty) {
      // ignore: avoid_print
        print("В базе данных нет записей.");
      }
    } catch (e) {
      // ignore: avoid_print
      print('Ошибка чтения из базы данных: $e');
    }
    return dbList; 
  }
}
