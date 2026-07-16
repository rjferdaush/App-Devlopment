import 'package:flutter/material.dart';

class Curd extends StatefulWidget {
  const Curd({super.key});

  @override
  State<Curd> createState() => _CurdState();
}

class _CurdState extends State<Curd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:  Text('Product From API', style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
