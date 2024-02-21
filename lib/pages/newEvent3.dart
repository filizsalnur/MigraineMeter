// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:migraine_meter/models/model.dart';
import '../services/data.dart';
import "./newEvent2.dart";

class NewEvent3 extends StatefulWidget {
  final DataModel dataModel;
  const NewEvent3({super.key, required this.dataModel});

  @override
  State<NewEvent3> createState() => _NewEvent3State();
}

class _NewEvent3State extends State<NewEvent3> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yeni Atak',
          style: TextStyle(color: Colors.purple, fontSize: 25),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.purple.shade900,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
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
                  Column(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            backgroundColor: MaterialStateProperty.all(
                                !squeezingPain
                                    ? Colors.purple.shade900
                                    : Colors.red),
                          ),
                          onPressed: () {
                            setState(() {
                              squeezingPain = !squeezingPain;
                            });
                          },
                          child: Image(
                            height: 80,
                            image: AssetImage('assets/c1.png'),
                          )),
                      Text(
                        "Sıkıştırıcı Ağrı",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            backgroundColor: MaterialStateProperty.all(
                                !feelingOfPressure
                                    ? Colors.purple.shade900
                                    : Colors.red),
                          ),
                          onPressed: () {
                            setState(() {
                              feelingOfPressure = !feelingOfPressure;
                            });
                          },
                          child: Image(
                            height: 80,
                            image: AssetImage('assets/c2.png'),
                          )),
                      Text(
                        "Basınç Hissi",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            backgroundColor: MaterialStateProperty.all(
                                !painWithMovement
                                    ? Colors.purple.shade900
                                    : Colors.red),
                          ),
                          onPressed: () {
                            setState(() {
                              painWithMovement = !painWithMovement;
                            });
                          },
                          child: Image(
                            height: 80,
                            width: 80,
                            image: AssetImage('assets/c3.png'),
                          )),
                      Text(
                        "Hareketle Ağrı",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor: MaterialStateProperty.all(
                              !nausea ? Colors.purple.shade900 : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            nausea = !nausea;
                          });
                        },
                        child: Image(
                          height: 80,
                          image: AssetImage('assets/c4.png'),
                        )),
                    Text(
                      "Mide Bulantısı",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor: MaterialStateProperty.all(
                              !vomiting ? Colors.purple.shade900 : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            vomiting = !vomiting;
                          });
                        },
                        child: Image(
                          height: 80,
                          image: AssetImage('assets/c5.png'),
                        )),
                    Text(
                      "Kusma",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor: MaterialStateProperty.all(
                              !sensitivityToLight
                                  ? Colors.purple.shade900
                                  : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            sensitivityToLight = !sensitivityToLight;
                          });
                        },
                        child: Image(
                          height: 80,
                          image: AssetImage('assets/c6.png'),
                        )),
                    Text(
                      "Işığa Hassasiyet",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor: MaterialStateProperty.all(
                              !sensitivityToSmell
                                  ? Colors.purple.shade900
                                  : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            sensitivityToSmell = !sensitivityToSmell;
                          });
                        },
                        child: Image(
                          height: 80,
                          image: AssetImage('assets/c8.png'),
                        )),
                    Text(
                      "Koku Hassasiyeti",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor: MaterialStateProperty.all(
                              !sensitivityToSound
                                  ? Colors.purple.shade900
                                  : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            sensitivityToSound = !sensitivityToSound;
                          });
                        },
                        child: Image(
                          height: 80,
                          image: AssetImage('assets/c7.png'),
                        )),
                    Text(
                      "Sese Hassasiyet",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor: MaterialStateProperty.all(
                              !visualDisturbances
                                  ? Colors.purple.shade900
                                  : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            visualDisturbances = !visualDisturbances;
                          });
                        },
                        child: Image(
                          height: 80,
                          image: AssetImage('assets/c9.png'),
                        )),
                    Text(
                      "Görme Bozukluğu",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor: MaterialStateProperty.all(
                              !runnyNose ? Colors.purple.shade900 : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            runnyNose = !runnyNose;
                          });
                        },
                        child: Image(
                          height: 80,
                          image: AssetImage('assets/c10.png'),
                        )),
                    Text(
                      "Burun Akıntısı",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor: MaterialStateProperty.all(
                              !dizziness ? Colors.purple.shade900 : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            dizziness = !dizziness;
                          });
                        },
                        child: Image(
                          height: 80,
                          image: AssetImage('assets/c11.png'),
                        )),
                    Text(
                      "Baş Dönmesi",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor: MaterialStateProperty.all(
                              !neckPain ? Colors.purple.shade900 : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            neckPain = !neckPain;
                          });
                        },
                        child: Image(
                          height: 80,
                          image: AssetImage('assets/c12.png'),
                        )),
                    Text(
                      "Boyun Ağrısı",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ]),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            widget.dataModel.setSymptoms(findSymptomsType());

                            widget.dataModel.printData();

                            print('---------------');
                            StorageServices().printAllSharedPreferences();
                            print('---------------');
                          },
                          child: Text(
                            "Devam",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                    ),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomBar(pageName: "pageName"),
    );
  }
}
