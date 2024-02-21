import 'dart:ui';
import 'dart:math';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:migraine_meter/components/bottomAppBar.dart';
import '../services/data.dart';
import 'newEvent1.dart';

class MainHistory extends StatefulWidget {
  const MainHistory({super.key});

  @override
  State<MainHistory> createState() => _MainHistoryState();
}

class _MainHistoryState extends State<MainHistory> {
  DateTime? selectedDate;
  Random random = new Random();

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
        backButton: false,
        onDateChanged: (date) {
          setState(() async {
            print(date);
            // dateData(this., intensity, type, sideEffects)

            await StorageServices.saveData(
                date.toString(),
                dateData(date.toString(), random.nextInt(10), "Migraine",
                    ["Nausea", "Vomiting"]));
          });
        },
        lastDate: DateTime.now(),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Selected Date: ${selectedDate.toString()}"),
          SizedBox(
            height: 500,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewEvent()),
              );
            },
            child: Text("Add new event"),
          ),
        ],
      )),
      bottomNavigationBar: BottomBar(pageName: "history"),
    );
  }
}
