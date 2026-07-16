import 'package:flutter/material.dart';
import 'package:task_add_list/Data%20Base/task_dataBase.dart';
import 'model/task_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  List<Task> tasks = [];
  final TextEditingController addTaskController = TextEditingController();

  @override
// # App St Haoar Sathe Sathe Jeno Age DataBase E Ki Ki Data Ase Tha Jeno Dekhay

  void initState(){
    // # initState() = Widget প্রথমবার তৈরি হলে একবারই চলবে। এটা দ্বিতীয়বার চলবে না।
    super.initState(); 
    refreshTask();
  }

  Future<void> refreshTask()async{
    // # TaskDatabase.getTask() aitha dia => DataBase Er Vitore E jay And Sob Data Ferot Dey Tasks er Vitor e
    tasks = await TaskDatabase.getTask();
    // # screen update
    setState(() {

    });
  }

  // # Future<void> মানে এই Function সময় নেবে। কারণ Database-এ Data Save করতে কিছু সময় লাগে।
  Future<void> addTask()async{
    //# Add Task er textfild tha khali kina tha check korbe ifelse condition dia
    if(addTaskController.text.trim().isEmpty) return;
    // # await TaskDatabase.insertTask() এখানে Database-এ Data Save হচ্ছে।
    await TaskDatabase.insertTask(Task(title: addTaskController.text, isDone: false));
    addTaskController.clear();
    await refreshTask();
  }

  Future<void>deleteTask(int id)async{
    await TaskDatabase.deteteTask(id);
    refreshTask();
  }

  Future<void>toggleTask(Task task)async{
    TaskDatabase.updateTask(
        Task(
            id: task.id,
            title: task.title,
            isDone: !task.isDone));
    refreshTask();
  } 
  Future<void>editTask(Task task)async{
    addTaskController.text=task.title;
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title : Text('Edit Task'),
        content: TextField(
          controller: addTaskController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.black),
              gapPadding: 4,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
              gapPadding: 4,
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),

            labelText: "Add Task",
            labelStyle: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),

            filled: true,
            fillColor: Colors.grey.shade100,

          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, 
              child: Text('Cancel')),

          TextButton(onPressed: (){
            TaskDatabase.updateTask(Task(title: addTaskController.text, isDone: task.isDone, id: task.id));
            refreshTask();
            addTaskController.clear();
            Navigator.pop(context);
          }, 
              child: Text('Save'))
        ],

      );
    }
    );
    
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Add Task", style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1
          ),
          ),
        ),

      body:Padding(padding: EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(
                controller: addTaskController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black),
                      gapPadding: 4,
                    ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(16),
                        gapPadding: 4,
                      ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.red,
                      )
                    ),

                    labelText: "Add Task",
                    labelStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),

                  filled: true,
                  fillColor: Colors.grey.shade100,

                ),
              )
              ),
              IconButton(onPressed: (){
                addTask();
              }, icon: Icon(Icons.add)),
            ],
          ),

          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context,index){
                  final task = tasks[index];
                  return ListTile(
                    leading: Checkbox(value: task.isDone, onChanged: (_){
                      toggleTask(task);
                    }),
                    title: Text(task.title),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: ()=> editTask(task), icon: Icon(Icons.edit,color: Colors.orange)),
                        IconButton(onPressed: (){
                          deleteTask(task.id!);
                        }, icon: Icon(Icons.delete,color: Colors.red)),
                      ],

                    ),

                  );
                }
            ),
          )

        ],
      ),
      ) ,





      );
  }
}
