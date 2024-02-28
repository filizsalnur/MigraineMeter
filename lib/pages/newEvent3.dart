// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:migraine_meter/components/symptom_component.dart';
import 'package:migraine_meter/models/model.dart';
import 'package:migraine_meter/pages/historyPage.dart';
import 'package:migraine_meter/pages/welcome_user.dart';
import '../services/data.dart';
import '../utils/alert_utils.dart';
import "./newEvent2.dart";
import 'package:quickalert/quickalert.dart';

class NewEvent3 extends StatefulWidget {
  final DataModel dataModel;
  const NewEvent3({super.key, required this.dataModel});

  @override
  State<NewEvent3> createState() => NewEvent3State();
}

class NewEvent3State extends State<NewEvent3> {
  bool squeezingPain = false;
  bool feelingOfPressure = false;
  bool painWithMovement = false;
  bool nausea = false;
  bool vomiting = false;
  bool sensitivityToLight = false;
  bool sensitivityToSound = false;
  bool sensitivityToSmell = false;
  bool visualDisturbances = false;
  bool runnyNose = false;
  bool dizziness = false;
  bool neckPain = false;

  findSymptomsType() {
    List<String> symptoms = [];
    if (squeezingPain) {
      symptoms.add("Squeezing Pain");
    }
    if (feelingOfPressure) {
      symptoms.add("Feeling of Pressure");
    }
    if (painWithMovement) {
      symptoms.add("Pain with Movement");
    }
    if (nausea) {
      symptoms.add("Nausea");
    }
    if (vomiting) {
      symptoms.add("Vomiting");
    }
    if (sensitivityToLight) {
      symptoms.add("Sensitivity to Light");
    }
    if (sensitivityToSound) {
      symptoms.add("Sensitivity to Sound");
    }
    if (sensitivityToSmell) {
      symptoms.add("Sensitivity to Smell");
    }
    if (visualDisturbances) {
      symptoms.add("Visual Disturbances");
    }
    if (runnyNose) {
      symptoms.add("Runny Nose");
    }
    if (dizziness) {
      symptoms.add("Dizziness");
    }
    if (neckPain) {
      symptoms.add("Neck Pain");
    }
    return symptoms;
  }

  changeSymptom(String symptom) {
    switch (symptom) {
      case 'Squeezing Pain':
        print("<<<<<<<<<<<<<<<<Squeezing Pain>>>>>>>>>>>>>>>>>>>>>>>>>>");

        setState(() {
          squeezingPain = !squeezingPain;
        });
        print(squeezingPain);
        break;
      case 'Feeling of Pressure':
        setState(() {
          feelingOfPressure = !feelingOfPressure;
        });
        break;
      case 'Pain with Movement':
        setState(() {
          painWithMovement = !painWithMovement;
        });
        break;
      case 'Nausea':
        setState(() {
          nausea = !nausea;
        });
        break;
      case 'Vomiting':
        setState(() {
          vomiting = !vomiting;
        });
        break;
      case 'Sensitivity to Light':
        setState(() {
          sensitivityToLight = !sensitivityToLight;
        });
        break;
      case 'Sensitivity to Sound':
        setState(() {
          sensitivityToSound = !sensitivityToSound;
        });
        break;
      case 'Sensitivity to Smell':
        setState(() {
          sensitivityToSmell = !sensitivityToSmell;
        });
        break;
      case 'Visual Disturbances':
        setState(() {
          visualDisturbances = !visualDisturbances;
        });
        break;
      case 'Runny Nose':
        setState(() {
          runnyNose = !runnyNose;
        });
        break;
      case 'Dizziness':
        setState(() {
          dizziness = !dizziness;
        });
        break;
      case 'Neck Pain':
        setState(() {
          neckPain = !neckPain;
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade900,
          elevation: 0,
        ),
        backgroundColor: Colors.purple.shade900,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Hangi semptomları yaşıyorsunuz?",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SymptomComponent(
                      value: "Sıkıştırıcı Ağrı",
                      imagePath: 'assets/c1.png',
                      controller: squeezingPain,
                      onChanged: () => changeSymptom('Squeezing Pain'),
                    ),
                    SymptomComponent(
                      value: "Basınç Hissi",
                      imagePath: 'assets/c2.png',
                      controller: feelingOfPressure,
                      onChanged: () => changeSymptom('Feeling of Pressure'),
                    ),
                    SymptomComponent(
                      value: "Hareketle Ağrı",
                      imagePath: 'assets/c3.png',
                      controller: painWithMovement,
                      onChanged: () => changeSymptom('Pain with Movement'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SymptomComponent(
                        value: "Mide Bulantısı",
                        imagePath: 'assets/c4.png',
                        controller: nausea,
                        onChanged: () => changeSymptom('Nausea'),
                      ),
                      SymptomComponent(
                        value: "Kusma",
                        imagePath: 'assets/c5.png',
                        controller: vomiting,
                        onChanged: () => changeSymptom('Vomiting'),
                      ),
                      SymptomComponent(
                        value: "Işığa Hassasiyet",
                        imagePath: 'assets/c6.png',
                        controller: sensitivityToLight,
                        onChanged: () => changeSymptom('Sensitivity to Light'),
                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SymptomComponent(
                        value: "Koku Hassasiyeti",
                        imagePath: 'assets/c8.png',
                        controller: sensitivityToSmell,
                        onChanged: () => changeSymptom('Sensitivity to Smell'),
                      ),
                      SymptomComponent(
                        value: "Sese Hassasiyet",
                        imagePath: 'assets/c7.png',
                        controller: sensitivityToSound,
                        onChanged: () => changeSymptom('Sensitivity to Sound'),
                      ),
                      SymptomComponent(
                        value: "Görme Bozukluğu",
                        imagePath: 'assets/c9.png',
                        controller: visualDisturbances,
                        onChanged: () => changeSymptom('Visual Disturbances'),
                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SymptomComponent(
                        value: "Burun Akıntısı",
                        imagePath: 'assets/c10.png',
                        controller: runnyNose,
                        onChanged: () => changeSymptom('Runny Nose'),
                      ),
                      SymptomComponent(
                        value: "Baş Dönmesi",
                        imagePath: 'assets/c11.png',
                        controller: dizziness,
                        onChanged: () => changeSymptom('Dizziness'),
                      ),
                      SymptomComponent(
                        value: "Boyun Ağrısı",
                        imagePath: 'assets/c12.png',
                        controller: neckPain,
                        onChanged: () => changeSymptom('Neck Pain'),
                      ),
                    ]),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            widget.dataModel.setSymptoms(findSymptomsType());

            await StorageServices.saveData(
                widget.dataModel.date!, widget.dataModel.convertToJson());

            print('---------------');
            StorageServices().printAllSharedPreferences();
            print('---------------');
            await AlertUtils()
                .successfulAlert("Atak başarıyla eklendi", context);
            await Future.delayed(Duration(milliseconds: 500));

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WelcomeUsernamePage();
            }));
            // ignore: use_build_context_synchronously
          },
          child: Icon(Icons.arrow_right_alt_outlined,
              size: 40, color: Colors.purple.shade900),
          backgroundColor: Colors.white,
        )

        // bottomNavigationBar: BottomBar(pageName: "pageName"),
        );
  }
}
