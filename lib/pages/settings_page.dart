import 'package:flutter/material.dart';
import 'package:migraine_meter/components/bottomAppBar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 3,
                      color: Colors.purple.shade900,
                      height: MediaQuery.of(context).size.height - 230,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        ],
                      )),
                ],
              ),
              Row(),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(pageName: "settings"),
      ),
    );
  }
}
