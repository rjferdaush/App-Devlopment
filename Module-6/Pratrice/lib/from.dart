import 'package:flutter/material.dart';

void main(){
  runApp(MyFrom());
}

class MyFrom extends StatefulWidget {
  const MyFrom({super.key});

  @override
  State<MyFrom> createState() => _MyFromState();
}

class _MyFromState extends State<MyFrom> {
 final name = TextEditingController();
 final password = TextEditingController();
 @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          centerTitle: true,
          title: Text("My From"),
        ),
        body:Padding(padding: EdgeInsets.all(16), 
        child :Column(
          children: [
            TextFormField( 
              controller: name,       
              decoration: InputDecoration(
                labelText: "Enter your Name",
                hintText: "Name In Upper Case",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller: password,        
              decoration: InputDecoration(
                labelText: "Enter your Passowrd",
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),
            FilledButton(onPressed: (){},
            style: ButtonStyle(                     
              minimumSize: WidgetStateProperty.all(Size.fromHeight(50)), 
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)) 
              ))
            ),
             child: Text("Submit"))
          ],
        ),
      )
      ),
    );
  }
}