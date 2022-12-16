import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class ButtonsList extends StatelessWidget {
  const ButtonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Center(
      child: Column(
        children: [
          TextButton(
              onPressed: () => theme.setTheme(ThemeData.light()),
              child: Text("Light Mode")),
          TextButton(
              onPressed: () => theme.setTheme(ThemeData.dark()),
              child: Text("Dark Mode"))
        ],
      ),
    );
  }
}
