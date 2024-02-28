import 'dart:ui';
import 'dart:math';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:migraine_meter/components/bottomAppBar.dart';
import 'package:migraine_meter/pages/calendar_page.dart';
import 'package:migraine_meter/pages/info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/data.dart';
import 'newEvent1.dart';

class MainHistory extends StatefulWidget {
  const MainHistory({Key? key});

  @override
  State<MainHistory> createState() => _MainHistoryState();
}

class _MainHistoryState extends State<MainHistory> {
  DateTime? selectedDate;
  Random random = Random();
  List<String> sharedKeys = [];
  int counter=0;

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
    });
     getSharedKey();
    super.initState();
  }
  getSharedKey() async {
    sharedKeys=await StorageServices.loadKeys(selectedDate!.toString().substring(0, 10));
    setState(() {
      sharedKeys=sharedKeys;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        white: Colors.white,
        black: Colors.black,
        accent: Colors.purple.shade900,
        backButton: false,
        onDateChanged: (date) {
          StorageServices.loadData(CalendarPageState().formatDateToString(date))
              .then((value) {
            print(value);
            setState(() {
              selectedDate = date;
            });
          });
        },
        lastDate: DateTime.now(),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
      ),
      body: FutureBuilder<List<String>>(
        future:
            StorageServices.loadData(selectedDate!.toString().substring(0, 10)),
          
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              List<String> dataParts = snapshot.data![index].split(',');
               
                
              return GestureDetector(
                onTap: () {
                  print(dataParts);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoPage(infos: dataParts)));
                },
                child: Container(
                        
                  color: Colors.purple.shade900,
                  child: Card(
                 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: dataParts.map((part) {
                                if (part.contains('intensity') ||
                                    part.contains('type') ) {
                                  if (!part.contains('part')) {
                                    return ListTile(
                                      title: Text(
                                        removeBracketsAndBraces(part.trim()),
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    );
                                  }
                                }
                                return SizedBox();
                              }).toList(),
                              
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: dataParts.map((part) {
                                if (part.contains('type')) {
                                  if (part.contains('part1')) {
                                    return Image.asset(
                                      'assets/b1.png',
                                      width: 100,
                                      height: 100,
                                    );
                                  } if (part.contains('part2')) {
                                    return Image.asset(
                                      'assets/b2.png',
                                      width: 100,
                                      height: 100,
                                    );
                                  }
                                    } if (part.contains('part3')) {
                            return Image.asset(
                              'assets/b3.png',
                              width: 100,
                              height: 100,
                            );
                          }  if (part.contains('part4')) {
                            return Image.asset(
                              'assets/b4.png',
                              width: 100,
                              height: 100,
                            );
                          } if (part.contains('part5')) {
                            return Image.asset(
                              'assets/b5.png',
                              width: 100,
                              height: 100,
                            );
                          }  if (part.contains('part6')) {
                            return Image.asset(
                              'assets/b6.png',
                              width: 100,
                              height: 100,
                            );
                          }  if (part.contains('part7')) {
                            return Image.asset(
                              'assets/b7.png',
                              width: 100,
                              height: 100,
                            );
                          }  if (part.contains('part8')) {
                            return Image.asset(
                              'assets/b8.png',
                              width: 100,
                              height: 100,
                            );
                          }  if (part.contains('part9')) {
                            return Image.asset(
                              'assets/b9.png',
                              width: 100,
                              height: 100,
                            );
                          }  if (part.contains('part10')) {
                            return Image.asset(
                              'assets/b10.png',
                              width: 100,
                              height: 100,
                            );
                          
                                } 
                                return SizedBox();
                              }).toList(),
                            ),
                          ),
                          
              
                        ],
                      ),
                     
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomBar(pageName: "history"),
    );
  }
}
String removeBracketsAndBraces(String input) {
  StringBuffer buffer = StringBuffer();
  bool inBracketOrBrace = false;
  String output = '';

  for (int i = 0; i < input.length; i++) {
    if (input[i] == '[' || input[i] == '{' || input[i] == '(' || input[i] == ']' || input[i] == '}' || input[i] == ')') {
     
    } else {
      output += input[i];
    }
    if(input[i] == ':'){
      output += '\n';
    }
      
  }

  return output;
}

