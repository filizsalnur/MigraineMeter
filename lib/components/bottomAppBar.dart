import 'package:flutter/material.dart';
import 'package:migraine_meter/pages/calendar_page.dart';
import 'package:migraine_meter/pages/historyPage.dart';

import '../pages/settings_page.dart';

class BottomBar extends StatefulWidget {
  final String pageName;
  const BottomBar({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 90,
      color: Colors.white,
      elevation: 100,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (widget.pageName != "calendar") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
                    );
                  }
                },
                child: Icon(
                  Icons.calendar_month,
                  size: 40,
                  color: (widget.pageName == "calendar")
                      ? Colors.white
                      : Colors.black,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: (widget.pageName == "calendar")
                      ? MaterialStateProperty.all(Colors.purple.shade900)
                      : MaterialStateProperty.all(Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (widget.pageName != "history") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainHistory()),
                    );
                  }
                },
                child: Icon(
                  Icons.history,
                  size: 40,
                  color: (widget.pageName == "history")
                      ? Colors.white
                      : Colors.black,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: (widget.pageName == "history")
                      ? MaterialStateProperty.all(Colors.purple.shade900)
                      : MaterialStateProperty.all(Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (widget.pageName != "settings") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  }
                },
                child: Icon(
                  Icons.settings,
                  size: 40,
                  color: (widget.pageName == "settings")
                      ? Colors.white
                      : Colors.black,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: (widget.pageName == "settings")
                      ? MaterialStateProperty.all(Colors.purple.shade900)
                      : MaterialStateProperty.all(Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
