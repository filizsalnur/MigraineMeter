// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:migraine_meter/models/model.dart';

import "./newEvent2.dart";

class NewEvent extends StatefulWidget {
  final DataModel dataModel;
  const NewEvent({super.key, required this.dataModel});

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  bool noAche = false;
  bool lowAche = false;
  bool mediumAche = false;
  bool highAche = false;
  bool veryHighAche = false;
  findAcheType() {
    if (noAche) {
      return "No Ache";
    }
    if (lowAche) {
      return "Low Ache";
    }
    if (mediumAche) {
      return "Medium Ache";
    }
    if (highAche) {
      return "High Ache";
    }
    if (veryHighAche) {
      return "Very High Ache";
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
                  "Bu atağınızın en yüksek şiddeti nedir?",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              !noAche ? Colors.purple.shade900 : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            noAche = true;
                            lowAche = false;
                            mediumAche = false;
                            highAche = false;
                            veryHighAche = false;
                          });
                        },
                        child: Image(
                          height: 150,
                          image: AssetImage('assets/3.png'),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              !lowAche ? Colors.purple.shade900 : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            noAche = false;
                            lowAche = true;
                            mediumAche = false;
                            highAche = false;
                            veryHighAche = false;
                          });
                        },
                        child: Image(
                          height: 150,
                          image: AssetImage('assets/4.png'),
                        )),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(!mediumAche
                              ? Colors.purple.shade900
                              : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            noAche = false;
                            lowAche = false;
                            mediumAche = true;
                            highAche = false;
                            veryHighAche = false;
                          });
                        },
                        child: Image(
                          height: 150,
                          image: AssetImage('assets/1.png'),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              !highAche ? Colors.purple.shade900 : Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            noAche = false;
                            lowAche = false;
                            mediumAche = false;
                            highAche = true;
                            veryHighAche = false;
                          });
                        },
                        child: Image(
                          height: 150,
                          image: AssetImage('assets/2.png'),
                        )),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  !veryHighAche
                                      ? Colors.purple.shade900
                                      : Colors.red),
                            ),
                            onPressed: () {
                              setState(() {
                                noAche = false;
                                lowAche = false;
                                mediumAche = false;
                                highAche = false;
                                veryHighAche = true;
                              });
                            },
                            child: Image(
                              height: 150,
                              image: AssetImage('assets/5.png'),
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.dataModel.setIntensity(findAcheType().toString());
            print(findAcheType().toString());
            widget.dataModel.printData();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewEvent2(
                dataModel: widget.dataModel,
              );
            }));
          },
          child: Icon(Icons.arrow_right_alt_outlined,
              size: 40, color: Colors.purple.shade900),
          backgroundColor: Colors.white,
        )

        // bottomNavigationBar: BottomBar(pageName: "pageName"),
        );
  }
}
