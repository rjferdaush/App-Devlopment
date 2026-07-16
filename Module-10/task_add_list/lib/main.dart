import 'package:flutter/material.dart';
import 'addTask.dart';
void main(){
  runApp(const ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home ({super.key});

  @override
  State<Home> createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameCantroller = TextEditingController();
    final TextEditingController passCantroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text("Log In Page", style:
        TextStyle(color: Colors.white,
        fontSize: 20, fontWeight: FontWeight.w600,
        letterSpacing: 1)
        ),
      ),

      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: nameCantroller,

            decoration: InputDecoration(

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.black)
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.black)
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
              ),


              filled: true,
              fillColor: Colors.grey.shade100,

              labelText: "Enter Your Name",
              labelStyle: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1
              ),
            ),
          ),

          SizedBox(height: 20),


          TextField(
            controller: passCantroller,

            decoration: InputDecoration(

              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black)
              ),

              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black)
              ),

              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)
              ),


              filled: true,
              fillColor: Colors.grey.shade100,

              labelText: "Password",
              labelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1
              ),
            ),
          ),

          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: TextButton(
                onPressed: () {},
                child: Text("Forgot Password"),
              ),
              ),
              
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password"),
                ),
              )

            ],

          ),

          SizedBox(height: 16),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> AddTask()
            )
            );
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 30),
              shadowColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
              child: Text("Submit"),
          )

        ],
      ),





      ),

    );
  }
}
