import 'package:flutter/material.dart';

void main() {
  runApp(const Button());
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[300],
          title: Text(
            "Buttons & Style",
            style: TextStyle(color: Colors.blueAccent[600]),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Wrap(
                spacing: 24, // horizontal gap
                runSpacing: 16, // vertical gap (নিচে নামলে)
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Elevated Button"),
                  ),

                  TextButton(onPressed: () {}, child: Text("Text Button")),

                  OutlinedButton(
                    onPressed: () {},
                    child: Text("outline Button"),
                  ),

                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),

                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                  ),

                  GestureDetector(
                    onTap: () {
                      print("GestureDetector tapped!");
                    },
                    onDoubleTap: () {
                      print("Double tapped!");
                    },
                    onLongPress: () {
                      print("Long pressed!");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Gesture Detectorr",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        print("InkWell tapped!");
                      },
                      borderRadius: BorderRadius.circular(8),
                      splashColor: Colors.blue.withOpacity(0.3),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Ink Well",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// class _MyHomeState extends State<MyHome> {

//   // Step 2 — selected value রাখার variable
//   String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [

//             // Step 3 — DropdownButton এ items এবং onChanged দাও
//             DropdownButton<String>(
//               value: selectedValue,
//               hint: Text("একটি বেছে নাও"),
//               items: [
//                 DropdownMenuItem(value: "Flutter", child: Text("Flutter")),
//                 DropdownMenuItem(value: "Dart", child: Text("Dart")),
//                 DropdownMenuItem(value: "Android", child: Text("Android")),
//                 DropdownMenuItem(value: "iOS", child: Text("iOS")),
//               ],
//               onChanged: (value) {
//                 setState(() {
//                   selectedValue = value; // select হলে save হবে
//                 });
//               },
//             ),

//             // কোনটা select হলো দেখাবে
//             Text("Selected: ${selectedValue ?? 'কিছু select হয়নি'}"),

//           ],