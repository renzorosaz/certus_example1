import 'package:flutter/material.dart';

import '../../utils/fonts.dart';

class ButtonAlert extends StatelessWidget {
  void Function()? onTap;
  String texto;

  ButtonAlert({
    required this.texto,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.purple[800]!.withOpacity(0.8)),
          child: Center(
              child: Text(texto,
                  style: APTextStyle(context)
                      .titleInputText
                      .copyWith(color: Colors.white)))),
    );
  }
}
