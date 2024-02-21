import 'package:flutter/material.dart';
import 'package:migraine_meter/components/bottomAppBar.dart';
import 'package:table_calendar/table_calendar.dart';
import '../services/data.dart';
import "./newEvent1.dart";
import '../models/model.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  DateTime? selectedDate;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DataModel dataModel = DataModel();

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  String formatDateToString(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }

  String formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }

    List<String> months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    List<String> suffixes = [
      'th',
      'st',
      'nd',
      'rd',
      'th',
      'th',
      'th',
      'th',
      'th',
      'th'
    ];

    int day = date.day;
    int month = date.month;
    int year = date.year;
    String suffix = suffixes[day % 10];

    String formattedDate = "${months[month]} ${day.toString()}$suffix, $year";

    return formattedDate;
  }

  String formatDateTr(DateTime? date) {
    if (date == null) {
      return '';
    }

    List<String> aylar = [
      '',
      'Ocak',
      'Şubat',
      'Mart',
      'Nisan',
      'Mayıs',
      'Haziran',
      'Temmuz',
      'Ağustos',
      'Eylül',
      'Ekim',
      'Kasım',
      'Aralık'
    ];

    List<String> ekler = [
      'inci',
      'inci',
      'üncü',
      'üncü',
      'inci',
      'inci',
      'inci',
      'inci',
      'inci',
      'inci'
    ];

    int gun = date.day;
    int ay = date.month;
    int yil = date.year;
    String ek = ekler[gun % 10];

    String formatliTarih = "$gun ${aylar[ay]} $yil";

    return formatliTarih;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            leading: null,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Text(
              formatDateTr(selectedDate),
              style: TextStyle(color: Colors.purple.shade900),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding: EdgeInsets.all(20),
                color: Colors.purple.shade900,
                child: Column(
                  children: [
                    Text(
                      "Son Migreninizin Tarihi:",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      formatDateTr(selectedDate),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    dataModel = DataModel(
                        date: null,
                        intensity: null,
                        type: null,
                        symptoms: null);
                  });

                  dataModel.setDate(formatDateToString(_selectedDay));
                  dataModel.printData();

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewEvent(dataModel: dataModel);
                  }));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.purple.shade900),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width - 150,
                  height: 60,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle, color: Colors.white),
                      Text(
                        "Yeni migren atağı girin",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
       bottomNavigationBar: BottomBar(pageName: "calendar"),
      
      ),
    );
  }
}
