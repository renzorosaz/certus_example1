import 'package:example1_flutter/register_screen.dart';
import 'package:flutter/material.dart';

import 'example_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: RegisterScreen(),
    );
  }
}
