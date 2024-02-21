import 'package:migraine_meter/services/data.dart';
import '../services/data.dart';

class DataModel {
  String? date;
  String? intensity;
  String? type;
  List<String>? symptoms;
  setDate(String date) => this.date = date;
  setIntensity(String intensity) => this.intensity = intensity;
  setType(String type) => this.type = type;
  setSymptoms(List<String> symptoms) => this.symptoms = symptoms;

  printData() {
    print("Date: ${date.toString()}");
    print("Intensity: $intensity");
    print("Type: $type");
    print("Symptoms: $symptoms");
  }

  String convertToJson()  {

    Map<String, dynamic> data = {
      "date": date.toString(),
      "intensity": intensity,
      "type": type,
      "symptoms": symptoms
    };

  

    return data.toString();
  }

  DataModel({this.date, this.intensity, this.type, this.symptoms});
}
