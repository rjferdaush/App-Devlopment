
import 'package:flutter/material.dart';
import 'add_habbit_screen.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> haditCard = [
      Task(
        titel: "Drinking Water",
        subTitel: "1/3 Glass Of Water",
        strickCount: 12,
      ),

      Task(titel: "Reading", subTitel: "Morning", strickCount: 2),
      Task(titel: "Reading", subTitel: "Morning", strickCount: 2),
      Task(titel: "Reading", subTitel: "Morning", strickCount: 2),
      Task(titel: "Reading", subTitel: "Morning", strickCount: 2),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 63, 77),
        centerTitle: true,
        title: Text(
          "Task",
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue[200],
            letterSpacing: 2,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: OrientationBuilder(
            builder: (context, orientation) {
              final isPortrait = MediaQuery.orientationOf(context) == Orientation.portrait;
              if (isPortrait) {
                return Column(
                  spacing: 16,
                  children: haditCard, /// list call and easy mathord
                );
              }
              return Column(
                spacing: 16,
                children: [
                  for(var i=0; i<haditCard.length;i=i+2)
                  Row(
                    spacing: 16, children: [
                       Expanded(child: haditCard[i]),
                       Expanded(child: haditCard[i+1]),
                       
                  
                  ]
                  )
                ],
              );
             

            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton( // filled elivated and fixed button are importent
        onPressed: () {
          // add a screen 
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>const addTask()),
          );
        },
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        elevation: 6,
        highlightElevation: 12,
        child: Icon(Icons.add),
        
      ),
    );
  }
}

// Custom Widget

class Task extends StatelessWidget {
  const Task({
    super.key,
    required this.titel,
    required this.subTitel,
    required this.strickCount,
  });
  final String titel;
  final String subTitel;
  final int strickCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // width: double.infinity,
      // height: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.water_drop_outlined, color: Colors.blueAccent),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(titel), Text(subTitel)],
              ),
            ],
          ),
          Column(children: [Text(strickCount.toString()), Text("Streak")]),
        ],
      ),
    );
  }
}
