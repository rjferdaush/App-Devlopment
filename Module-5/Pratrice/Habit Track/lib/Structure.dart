import 'package:flutter/material.dart';

void main(){
  runApp(const my_App());
}

class my_App extends StatelessWidget {
  const my_App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: homeActivity(),
    );
  }
}

class homeActivity extends StatelessWidget{
  const homeActivity({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Code Practice'),
      ),
      body: Container(
        child: const Center(
          child: Text('Hello Ferdaush'),
        ),
      ),
    );
  }
}
