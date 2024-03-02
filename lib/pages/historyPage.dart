import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:migraine_meter/components/bottomAppBar.dart';
import 'package:migraine_meter/pages/calendar_page.dart';
import 'package:migraine_meter/pages/info.dart';
import 'package:migraine_meter/pages/newEvent2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/data.dart';
import 'newEvent1.dart';
import '../models/model.dart';

class MainHistory extends StatefulWidget {
  const MainHistory({Key? key});

  @override
  State<MainHistory> createState() => _MainHistoryState();
}

class _MainHistoryState extends State<MainHistory> {
  DateTime? selectedDate;
  Random random = Random();
  DataModel dataModel = DataModel();

  String englishToTurkish(String value) {
    switch (value) {
      case 'intensity: No Ache':
        return 'Şiddet: Ağrı Yok';
      case 'intensity: Low Ache':
        return 'Şiddet: Hafif Ağrı';
      case 'intensity: Medium Ache':
        return 'Şiddet: Orta Ağrı';
      case 'intensity: High Ache':
        return 'Şiddet: Yüksek Ağrı';
      case 'intensity: Very High Ache':
        return 'Şiddet: Çok Yüksek Ağrı';
      default:
        return value;
    }
  }

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
    });
    super.initState();
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
          setState(() {
            selectedDate = date;
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
              return InkWell(
                onTap: () {
                  if (!dataParts.contains('No data')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(
                            info: dataParts,
                            dateOfEvent: selectedDate.toString()),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade900,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Card(
                    color: Colors.deepPurpleAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: dataParts.map((part) {
                                if (!part.contains("No data")) {
                                  print('no data');

                                  if (part.contains('intensity')) {
                                    return ListTile(
                                      title: Text(
                                        englishToTurkish(
                                            removeBracketsAndBraces(
                                                part.trim())),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }
                                }
                                return SizedBox();
                              }).toList(),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Column(
                              children: [
                                for (var part in dataParts)
                                  if (part.contains('No data'))
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Migren yok",
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      dataModel = DataModel(
                                                        date: selectedDate
                                                            .toString(),
                                                        intensity: null,
                                                        type: null,
                                                        symptoms: null,
                                                      );
                                                    });

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            NewEvent(
                                                                dataModel:
                                                                    dataModel),
                                                      ),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.purple.shade900,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    padding: EdgeInsets.all(20),
                                                  ),
                                                  child: Text(
                                                    "Migren atağı girin",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.favorite_outline_sharp,
                                              size: 100,
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  else if (part.contains('type'))
                                    if (part.contains('part1'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b1.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                                    else if (part.contains('part2'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b2.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                                    else if (part.contains('part3'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b3.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                                    else if (part.contains('part4'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b4.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                                    else if (part.contains('part5'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b5.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                                    else if (part.contains('part6'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b6.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                                    else if (part.contains('part7'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b7.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                                    else if (part.contains('part8'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b8.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                                    else if (part.contains('part9'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b9.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                                    else if (part.contains('part10'))
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/b10.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      )
                              ],
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

  String removeBracketsAndBraces(String input) {
    StringBuffer buffer = StringBuffer();
    bool inBracketOrBrace = false;

    for (int i = 0; i < input.length; i++) {
      if (input[i] == '[' || input[i] == '{') {
        inBracketOrBrace = true;
      } else if (input[i] == ']' || input[i] == '}') {
        inBracketOrBrace = false;
      } else if (!inBracketOrBrace) {
        buffer.write(input[i]);
      }
    }

    return buffer.toString();
  }
}
