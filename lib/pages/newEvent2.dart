// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:migraine_meter/models/model.dart';

import "./NewEvent2.dart";
import 'newEvent3.dart';


class NewEvent2 extends StatefulWidget {
  final DataModel dataModel;
  const NewEvent2({super.key,
  required this.dataModel,});

  @override
  State<NewEvent2> createState() => _NewEvent2State();
}

class _NewEvent2State extends State<NewEvent2> {
  bool part1 = false;
  bool part2 = false;
  bool part3 = false;
  bool part4 = false;
  bool part5 = false;
  bool part6 = false;
  bool part7 = false;
  bool part8 = false;
  bool part9 = false;
  bool part10 = false;

  findAchePart() {
    if (part1) {
      return "part1";
    }
    if (part2) {
      return "part2";
    }
    if (part3) {
      return "part3";
    }
    if (part4) {
      return "part4";
    }
    if (part5) {
      return "part5";
    }
    if (part6) {
      return "part6";
    }
    if (part7) {
      return "part7";
    }
    if (part8) {
      return "part8";
    }
    if (part9) {
      return "part9";
    }
    if (part10) {
      return "part10";
    }
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
                height: 30,
              ),
              Text(
                "Ağrı nerede Başladı?",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            part1 ? Colors.red[400] : Colors.purple.shade100),
                      ),
                      onPressed: () {
                        setState(() {
                          part1 = true;
                          part2 = false;
                          part3 = false;
                          part4 = false;
                          part5 = false;
                          part6 = false;
                          part7 = false;
                          part8 = false;
                          part9 = false;
                          part10 = false;
                        });
                      },
                      child: Image(
                        height: 150,
                        image: AssetImage('assets/b2.png'),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            part2 ? Colors.red[400] : Colors.purple.shade100),
                      ),
                      onPressed: () {
                        setState(() {
                          part1 = false;
                          part2 = true;
                          part3 = false;
                          part4 = false;
                          part5 = false;
                          part6 = false;
                          part7 = false;
                          part8 = false;
                          part9 = false;
                          part10 = false;
                        });
                      },
                      child: Image(
                        height: 150,
                        image: AssetImage('assets/b3.png'),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            part3 ? Colors.red[400] : Colors.purple.shade100),
                      ),
                      onPressed: () {
                        setState(() {
                          part1 = false;
                          part2 = false;
                          part3 = true;
                          part4 = false;
                          part5 = false;
                          part6 = false;
                          part7 = false;
                          part8 = false;
                          part9 = false;
                          part10 = false;
                        });
                      },
                      child: Image(
                        height: 150,
                        image: AssetImage('assets/b4.png'),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            part4 ? Colors.red[400] : Colors.purple.shade100),
                      ),
                      onPressed: () {
                        setState(() {
                          part1 = false;
                          part2 = false;
                          part3 = false;
                          part4 = true;
                          part5 = false;
                          part6 = false;
                          part7 = false;
                          part8 = false;
                          part9 = false;
                          part10 = false;
                        });
                      },
                      child: Image(
                        height: 150,
                        image: AssetImage('assets/b5.png'),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            part5 ? Colors.red[400] : Colors.purple.shade100),
                      ),
                      onPressed: () {
                        setState(() {
                          part1 = false;
                          part2 = false;
                          part3 = false;
                          part4 = false;
                          part5 = true;
                          part6 = false;
                          part7 = false;
                          part8 = false;
                          part9 = false;
                          part10 = false;
                        });
                      },
                      child: Image(
                        height: 150,
                        image: AssetImage('assets/b6.png'),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            part6 ? Colors.red[400] : Colors.purple.shade100),
                      ),
                      onPressed: () {
                        setState(() {
                          part1 = false;
                          part2 = false;
                          part3 = false;
                          part4 = false;
                          part5 = false;
                          part6 = true;
                          part7 = false;
                          part8 = false;
                          part9 = false;
                          part10 = false;
                        });
                      },
                      child: Image(
                        height: 150,
                        image: AssetImage('assets/b11.png'),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            part7 ? Colors.red[400] : Colors.purple.shade100),
                      ),
                      onPressed: () {
                        setState(() {
                          part1 = false;
                          part2 = false;
                          part3 = false;
                          part4 = false;
                          part5 = false;
                          part6 = false;
                          part7 = true;
                          part8 = false;
                          part9 = false;
                          part10 = false;
                        });
                      },
                      child: Image(
                        height: 150,
                        image: AssetImage('assets/b8.png'),
                      )),
                  ElevatedButton(

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            part8 ? Colors.red[400] : Colors.purple.shade100),
                      ),
                      onPressed: () {
                        setState(() {
                          part1 = false;
                          part2 = false;
                          part3 = false;
                          part4 = false;
                          part5 = false;
                          part6 = false;
                          part7 = false;
                          part8 = true;
                          part9 = false;
                          part10 = false;
                        });
                      },
                      child: Image(
                        height: 150,
                        image: AssetImage('assets/b9.png'),

                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(part9
                                ? Colors.red[400]
                                : Colors.purple.shade100),
                          ),
                          onPressed: () {
                            setState(() {
                              part1 = false;
                              part2 = false;
                              part3 = false;
                              part4 = false;
                              part5 = false;
                              part6 = false;
                              part7 = false;
                              part8 = false;
                              part9 = true;
                              part10 = false;
                            });
                          },
                          child: Image(
                            height: 150,
                            image: AssetImage('assets/b10.png'),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(part10
                                ? Colors.red[400]
                                : Colors.purple.shade100),
                          ),
                          onPressed: () {
                            setState(() {
                              part1 = false;
                              part2 = false;
                              part3 = false;
                              part4 = false;
                              part5 = false;
                              part6 = false;
                              part7 = false;
                              part8 = false;
                              part9 = false;
                              part10 = true;
                            });
                          },
                          child: Image(
                            height: 150,
                            image: AssetImage('assets/b7.png'),
                          )),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ElevatedButton(
                          onPressed: () {
                            print(findAchePart());
                            widget.dataModel.setType(findAchePart());
                            widget.dataModel.printData();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  NewEvent3(dataModel: widget.dataModel)),
                            );
                            
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
