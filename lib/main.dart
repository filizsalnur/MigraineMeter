import 'package:flutter/material.dart';

import 'package:migraine_meter/pages/historyPage.dart';
import 'pages/welcome_user.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeUsernamePage(),
    );
  }
}
