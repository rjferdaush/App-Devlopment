import 'package:flutter/material.dart';
// import 'api.dart';
import 'Curd/crud.dart';

class AppRun extends StatelessWidget {
  const AppRun({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: API();
      home: Curd(),
    );
  }
}

