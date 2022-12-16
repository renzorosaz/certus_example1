import 'package:example1_flutter/home_page.dart';
import 'package:example1_flutter/register_screen.dart';
import 'package:example1_flutter/widgets/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        lazy: false,
        //Listener
        create: (_) => ThemeChanger(ThemeData.dark()),
        child: MaterialAppWithTheme());
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //declaramos una variable theme, asignado el valor de:
    // los cambios que puedan existir al momento de usar la clase ThemeChanger
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: theme.getTheme(),
      title: 'Material App',
      home: HomePage(),
    );
  }
}
