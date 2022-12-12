import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
              "https://www.pixelstalk.net/wp-content/uploads/2016/12/Beautiful-Landscape-Background-for-PC-768x480.jpg"),
          SizedBox(height: 25),
          textPlacesPoints(),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.call, color: Colors.blue),
                  SizedBox(height: 8),
                  Text("CALL", style: TextStyle(color: Colors.blue))
                ],
              ),
              Column(
                children: [
                  Icon(Icons.route, color: Colors.blue),
                  SizedBox(height: 8),
                  Text("ROUTE", style: TextStyle(color: Colors.blue))
                ],
              ),
              Column(
                children: [
                  Icon(Icons.share, color: Colors.blue),
                  SizedBox(height: 8),
                  Text("SHARE", style: TextStyle(color: Colors.blue))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget textPlacesPoints() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Oeschinen Lake Campground",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Kandersteg, Switfzerland",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.grey.shade500))
          ],
        ),
        SizedBox(width: 70),
        //ROW ICONO ESTRELLA Y TEXTO 41
        Row(
          children: [
            Icon(Icons.stars, color: Colors.red),
            SizedBox(width: 4),
            Text("41")
          ],
        )
      ],
    );
  }
}
