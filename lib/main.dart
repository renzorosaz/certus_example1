import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text(
            'Mi primer APPBAR',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(color: Colors.amberAccent.shade100.withOpacity(0.5)),
      ),
    );
  }
}
