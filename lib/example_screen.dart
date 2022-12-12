import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
              "https://www.pixelstalk.net/wp-content/uploads/2016/12/Beautiful-Landscape-Background-for-PC-768x480.jpg")
        ],
      ),
    );
  }
}
