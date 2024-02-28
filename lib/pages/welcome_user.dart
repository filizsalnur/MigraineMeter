import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'calendar_page.dart';

class WelcomeUsernamePage extends StatefulWidget {
  const WelcomeUsernamePage({Key? key}) : super(key: key);

  @override
  _WelcomeUsernamePageState createState() => _WelcomeUsernamePageState();
}

class _WelcomeUsernamePageState extends State<WelcomeUsernamePage> {
  String _allData = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _allData =
          prefs.getKeys().map((key) => '$key: ${prefs.get(key)}').join('\n');
    });

    // Simulate loading time with a delay
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });

    // Navigate to the next page after loading
    navigateToCalendarPage();
  }

  void navigateToCalendarPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CalendarPage(),
        settings: RouteSettings(arguments: _allData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        elevation: 0,
      ),
      backgroundColor: Colors.purple.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isLoading)
              AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: 1.0,
                child: Text(
                  'Welcome',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: 1.0,
              child: Text(
                'Loading...',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            if (_isLoading) SizedBox(height: 20),
            Text('Welcome',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
