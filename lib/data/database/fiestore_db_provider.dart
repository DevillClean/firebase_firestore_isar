import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/data/model/bmi_data.dart';

class FireStoreDbProvider{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<void> writeToDb(BmiData model) async {
    try{
      await _firestore.collection('calculator').doc(model.id.toString()).set({
        "age": model.age,
        "height": model.height,
        "weight": model.weight,
        "totalBmi": model.bmiResult,
      });
    } catch (e){
      // ignore: avoid_print
      print('error writing to Firestore:$e');
    }
  }

  Future<List<BmiData>> readFromDb() async {
    try{
      QuerySnapshot snapshot = await _firestore.collection('calculator').get();
      List<BmiData> models = snapshot.docs.map((doc){
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // ignore: avoid_print
        print('Document ID: ${doc.id}');
        // ignore: avoid_print
        print('Document Data: $data');
        return BmiData(
          id: 'id', 
          age: int.tryParse(data['age'].toString()) ?? 0,
          height: int.tryParse(data['height'].toString()) ?? 0,    
          weight: int.tryParse(data['weight'].toString()) ?? 0,   
          bmiResult:  int.tryParse(data['totalBmi'].toString()) ?? 0, 
          );
      }).toList(); 
      return models;
    } catch(e){
      // ignore: avoid_print
      print('Error deading from FireStore: $e');
      return List.empty();
    }
  }
}