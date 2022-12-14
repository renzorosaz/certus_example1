import 'package:flutter/material.dart';

import '../../utils/fonts.dart';

class Button extends StatelessWidget {
  void Function()? onTap;

  Button({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 350,
          height: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.purple[800]!.withOpacity(0.8)),
          child: Center(
              child: Text("Registrar",
                  style: APTextStyle(context)
                      .titleInputText
                      .copyWith(color: Colors.white)))),
    );
  }
}
