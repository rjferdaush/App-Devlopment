// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text("Add Task", style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
        ),
      ),

      body: Padding(padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index){  
            return ListTile(
              leading: Checkbox(value: false, onChanged: (_){}),
              title: Text("Task-${index+1}"),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.lightBlueAccent,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,))
                ],
              ),
            );
          }
        ),      
      
      
      ),

    );
  }
}