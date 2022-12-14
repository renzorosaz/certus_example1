import 'package:flutter/material.dart';

import '../../utils/fonts.dart';

class ButtonAlertOnlyBorder extends StatelessWidget {
  void Function()? onTap;
  String texto;

  ButtonAlertOnlyBorder({
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
              border: Border.all(color: Colors.purple[800]!),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white),
          child: Center(
              child: Text(texto,
                  style: APTextStyle(context)
                      .titleInputText
                      .copyWith(color: Colors.purple[800])))),
    );
  }
}
