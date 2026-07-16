import 'package:flutter/material.dart';
import 'addTask.dart';

void main() {
  runApp(AgainStart());
}

class AgainStart extends StatelessWidget {
  const AgainStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          "Project Online",
          style: TextStyle(
            color: Colors.blueAccent,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "In Uppercase",
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Enter Your Name",
                labelStyle: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.pinkAccent, width: 1),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: "In Uppercase",
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Enter Your Name",
                labelStyle: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.pinkAccent, width: 1),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
            ),

            SizedBox(height: 16),
            
            ElevatedButton(onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> Addtask()
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors. grey[200],
              foregroundColor: Colors.cyan,
            ),
            
             child: Text("Submit",style:  TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
             ), 
             )
             ),
          ],

        ),
      ),
    );
  }
}
