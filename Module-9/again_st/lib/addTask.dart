// ignore_for_file: file_names
import 'package:again_st/Model/task_model.dart';
import 'package:flutter/material.dart';

import 'Data Base/task_dataBase.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  List<TaskModel> tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    refreshTask();
  }

  Future<void> refreshTask() async {
    tasks = await TaskDatabase.getTask();
    setState(() {});
  }

  Future<void>addTask() async {
    await TaskDatabase.insertTask(TaskModel(titel: taskController.text, isDone:false));
    
    refreshTask();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "Add Task",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // INPUT ROW
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      labelText: "Add Tasks",
                      labelStyle: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.purple, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),

                IconButton(onPressed: () {
                  addTask();
                }, icon: Icon(Icons.add)),
              ],
            ),

            SizedBox(height: 10),

            // TASK LIST
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];

                  return ListTile(
                    leading: Checkbox(value: task.isDone, onChanged: (_) {}),
                    title: Text(task.titel),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit, color: Colors.lightBlueAccent),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
