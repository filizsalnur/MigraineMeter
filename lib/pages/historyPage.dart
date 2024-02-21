import 'dart:ui';
import 'dart:math';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:migraine_meter/components/bottomAppBar.dart';
import 'package:migraine_meter/pages/calendar_page.dart';
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
          StorageServices.loadData(CalendarPageState().formatDateToString(date)).then((value) {
            print(value);
            setState(() {
              selectedDate = date;
            });
          });
        },
        lastDate: DateTime.now(),
        events: List.generate(100, (index) => DateTime.now().subtract(Duration(days: index * random.nextInt(5)))),
      ),
      body: FutureBuilder<List<String>>(
        future: StorageServices.loadData(selectedDate!.toString().substring(0, 10)),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
         
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                 List<String> dataParts = snapshot.data![index].split(',');
                return Container(
                  height: 250,
                  color: Colors.purple.shade900,
                   child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: dataParts.map((part) {
                        return ListTile(
                          title: Text(removeBracketsAndBraces(part.trim()), style: TextStyle(fontSize: 25),), 
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            );
          
        },
      ),
    );
  }
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
