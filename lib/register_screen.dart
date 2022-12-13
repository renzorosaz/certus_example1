import 'package:example1_flutter/utils/fonts.dart';
import 'package:example1_flutter/widgets/input/input_password.dart';
import 'package:example1_flutter/widgets/list/list_buttons_social_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // BRINDA SEGURIDAD A TUS WIDGETS ( PARA QUE SE MANTENGA EN UNA ZONA SEGURA)
        child: SingleChildScrollView(
          //PERMITE HACER SCROLLEABLE AL COLUMN
          child: Center(
            //  PERMITE COLOCAR EN EL CENTRO CUALQUIER WIDGET
            child: Column(
              children: [
                Column(
                    // WIDGET PADRE QUE CONTIENE LISTA DE WIDETS HORIZONTALMENTE
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      titleRegister(),
                      SizedBox(
                        height: 12,
                      ),
                      underTitleRegister(),
                      SizedBox(
                        height: 67,
                      ),
                      ListButtonsSocialMedia(),
                      SizedBox(
                        height: 40,
                      ),
                      underSubTitleRegister()
                    ]),
                SizedBox(height: 46),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: () {
                    Form.of(primaryFocus!.context!)!.save();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputTextFullName(context, fullNameController),
                      SizedBox(height: 19),
                      Text("Email", style: APTextStyle(context).titleInputText),
                      SizedBox(height: 5),
                      inputEmail(context, emailController),
                      SizedBox(height: 19),
                      Text("Password",
                          style: APTextStyle(context).titleInputText),
                      SizedBox(height: 5),
                      // MOSTRAR WIDGETS  :  COMO METODOS O COMO WIDGETS PERSONALIZADOS
                      //InputPassword()
                      changeVisibility(context),
                      SizedBox(height: 50),
                      Container(
                        width: 350,
                        height: 52,
                        child: TextButton(
                            style: ButtonStyle(
                                //backgroundColor:MaterialStateProperty.resolveWith((states) => print(states);)
                                ),
                            onPressed: () {},
                            child: Text("Registrar")),
                      )
                      // GestureDetector(
                      //   onTap: () {
                      //     print("Voy a registrar a este usuario");
                      //   },
                      //   child: Container(
                      //       width: 350,
                      //       height: 52,
                      //       decoration: BoxDecoration(
                      //           border: Border.all(
                      //               color: Colors.blueAccent, width: 1),
                      //           borderRadius: BorderRadius.circular(5),
                      //           color: Colors.blueAccent),
                      //       child: Center(
                      //           child: Text("Registrar",
                      //               style: APTextStyle(context)
                      //                   .titleInputText
                      //                   .copyWith(
                      //                       color: Colors.white,
                      //                       fontSize: 17)))),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container changeVisibility(BuildContext context) {
    return Container(
        width: 350,
        height: 52,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
            obscureText: _isObscure,
            controller: passController,
            validator: (String? value) {
              return (value!.length <= 8)
                  ? "Su contraseña debe tener 8 dígitos"
                  : null;
            },
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

Widget inputEmail(BuildContext context, TextEditingController emailController) {
  return Column(
    children: [
      Container(
          width: 350,
          height: 52,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
              controller: emailController,
              validator: (String? value) {
                return (!value!.contains('@')) ? "Not is a valid email" : null;
              },
              decoration: InputDecoration(
                  hintText: "Ingrese su email",
                  hintStyle: APTextStyle(context)
                      .titleInputText
                      .copyWith(color: Colors.grey.shade500),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100))))),
    ],
  );
}

Widget inputTextFullName(
    BuildContext context, TextEditingController fullNameController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Full name", style: APTextStyle(context).titleInputText),
      SizedBox(height: 5),
      Container(
          width: 350,
          height: 52,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
              validator: (String? value) {
                return (value!.isEmpty) ? "No puede ser vacio" : null;
              },
              controller: fullNameController,
              decoration: InputDecoration(
                  hintText: "Ingrese su nombre completo",
                  hintStyle: APTextStyle(context)
                      .titleInputText
                      .copyWith(color: Colors.grey.shade500),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100))))),
    ],
  );
}

Widget underSubTitleRegister() {
  return Text("o Register with Email",
      style: GoogleFonts.nunito(
          fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500));
}

Widget titleRegister() {
  return Text("Register",
      style: GoogleFonts.nunito(fontSize: 25, fontWeight: FontWeight.bold));
}

Widget underTitleRegister() {
  return Text("Register to see more",
      style: GoogleFonts.nunito(
          fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500));
}
