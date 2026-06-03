import 'package:flutter/material.dart';

void main() {
  runApp(MyImage());
}

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[350],
          title: Text(
            "Image Show",
            style: TextStyle(color: Colors.blueAccent[400]),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Wrap(
                children: [
                  Image.network(
                    'https://picsum.photos/300',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Image.asset('assets/pic.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
