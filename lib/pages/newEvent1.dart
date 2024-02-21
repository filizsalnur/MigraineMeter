// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import "./newEvent2.dart";

class NewEvent extends StatefulWidget {
  const NewEvent({super.key});

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  bool noAche = false;
  bool lowAche = false;
  bool mediumAche = false;
  bool highAche = false;
  bool veryHighAche = false;
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
                        backgroundColor: MaterialStateProperty.all(
                            !mediumAche ? Colors.purple.shade900 : Colors.red),
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
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewEvent2()));
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
