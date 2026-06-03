import 'package:flutter/material.dart';
import 'dashBord.dart';

void main() {
  runApp(habbitTracker());
}

class habbitTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Habbit Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

