import 'package:example1_flutter/utils/fonts.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  InputPassword({Key? key}) : super(key: key);

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _isObscure = true;
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 52,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
            obscureText: _isObscure,
            controller: passController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(_isObscure
                        ? Icons.visibility
                        : Icons.visibility_off_rounded)),
                hintText: "Ingrese su password",
                hintStyle: APTextStyle(context)
                    .titleInputText
                    .copyWith(color: Colors.grey.shade500),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100)))));
  }
}
