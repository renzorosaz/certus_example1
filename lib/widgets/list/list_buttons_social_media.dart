import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListButtonsSocialMedia extends StatelessWidget {
  const ListButtonsSocialMedia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  // Otra opción Color(0xffECEFF1)
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(Icons.facebook),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(FontAwesomeIcons.google, color: Colors.yellow[700]),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(FontAwesomeIcons.instagram, color: Colors.red[300]),
            ),
          ],
        )),
      ],
    );
  }
}
