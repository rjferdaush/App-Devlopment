import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // ✅ Data list
  final List<Map<String, dynamic>> items = [
    {"name": "Flutter", "color": Colors.blue},
    {"name": "Dart", "color": Colors.green},
    {"name": "Android", "color": Colors.orange},
    {"name": "iOS", "color": Colors.red},
    {"name": "Python", "color": Colors.purple},
    {"name": "JavaScript", "color": Colors.yellow},
    {"name": "Java", "color": Colors.teal},
    {"name": "Kotlin", "color": Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView.builder"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,      // ✅ ২টা column
            crossAxisSpacing: 10,   // ✅ column gap
            mainAxisSpacing: 10,    // ✅ row gap
            childAspectRatio: 1.5,  // ✅ item এর width:height ratio
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: items[index]["color"].withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: items[index]["color"],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.code,
                    color: items[index]["color"],
                    size: 30,
                  ),
                  SizedBox(height: 8),
                  Text(
                    items[index]["name"],  // ✅ list থেকে নাম নেয়
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: items[index]["color"],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}