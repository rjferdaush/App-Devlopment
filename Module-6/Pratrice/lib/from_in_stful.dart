import 'package:flutter/material.dart';
import 'package:pratrice/from.dart';

void main(){
  runApp(const MyFrom());
}

class MyFrom extends StatefulWidget {
  const MyFrom({super.key});

  @override
  State<MyFrom> createState() => _MyFromState();
}

class _MyFromState extends State<MyFrom> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isPasswordShow = true; 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[350],
          title: Text("My From",
          style: TextStyle(
            color:Colors.black,
          ),
        ),
        ),
        body: Padding(padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  
                  labelStyle: TextStyle(
                    color: Colors.amberAccent
                  ),

                  hintText: "Enter Your Name",
                  hintStyle: TextStyle(
                    color:Colors.blueGrey[300],
                  ),

                  floatingLabelStyle: TextStyle(color: Colors.cyanAccent),

                  prefixIcon: Icon(Icons.person),


                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent), 
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyanAccent,)
                    ),
                ),

                validator: (value){ 
                if(value==null){
                  return "Name Required";
                }
                else null;
                },

              ),

              


              SizedBox(height: 16,),

              TextField(
                controller: passwordController,
                keyboardType: TextInputType.number,
                // obscureText: isHidden,
                // minLines: 20,
                maxLength: 24,
                cursorColor: Colors.brown,

                decoration: InputDecoration(
                  label: Text("Password"),
                  labelStyle: TextStyle(color: Colors.deepPurple[400]),

                  hint: Text("Use Defficult Password"),
                  hintStyle: TextStyle(color: Colors.blueGrey[300]),

                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.remove_red_eye),

                  
                  floatingLabelStyle: TextStyle(color: Colors.cyanAccent,fontSize: 16),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.cyanAccent, width: 2 )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
                style: TextStyle(fontSize: 16, letterSpacing: 1, color: Colors.brown[400]),
              )
              
              
            ],
          ) 
        ),       
        
        
        ),
      ),
    );
  }
}