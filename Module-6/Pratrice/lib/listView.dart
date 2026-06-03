import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // ✅ Data list — এখান থেকে item নেবে
  final List<String> items = [
    "Flutter",
    "Dart",
    "Android",
    "iOS",
    "React Native",
    "Python",
    "JavaScript",
    "Java",
    "Kotlin",
    "Swift",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView.builder"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: items.length, // ✅ কতটা item আছে
          itemBuilder: (context, index) { // ✅ প্রতিটা item কেমন দেখাবে
            return Container(
              margin: EdgeInsets.only(bottom: 10), // item এর নিচে gap
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue),
              ),
              child: Row(
                children: [
                  // ── নম্বর দেখাবে ──
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}", // ✅ 1, 2, 3...
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  // ── item এর নাম দেখাবে ──
                  Text(
                    items[index], // ✅ list থেকে item নেবে
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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