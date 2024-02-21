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
        white: Colors.white,
    black: Colors.black,
    accent: Colors.purple.shade900,
        backButton: false,
        onDateChanged: (date) {
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
         
        ],
      )),
      bottomNavigationBar: BottomBar(pageName: "history"),
    );
  }
}
