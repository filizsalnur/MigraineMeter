class DataModel {
  DateTime? date;
  String? intensity;
  String? type;
  List<String>? symptoms;
  setDate(DateTime date) => this.date = date;
  setIntensity(String intensity) => this.intensity = intensity;
  setType(String type) => this.type = type;
  setSymptoms(List<String> symptoms) => this.symptoms = symptoms;

  printData(){
    print("Date: ${date.toString()}");
    print("Intensity: $intensity");
    print("Type: $type");
    print("Symptoms: $symptoms");
  }
  

  DataModel({this.date, this.intensity, this.type, this.symptoms});
}