import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';
class API extends StatelessWidget {
  const API({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  List user=[];

  Future<void>getUser()async{
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users')
    );

    if(response.statusCode==200){
      setState(() {
        user = jsonDecode(response.body);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('API',style: TextStyle(color: Colors.black),),
      ),

      body: Padding(padding: EdgeInsetsGeometry.all(16),

        child: ListView.builder(
          itemCount: user.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(user[index]['name']),
                subtitle: Text(user[index]['email']),
                leading: CircleAvatar(
                    child: Text(user[index]['name'][0])
                ),
              ),
            );
          },),


      ),
    );
  }
}





