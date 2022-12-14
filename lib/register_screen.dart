import 'package:example1_flutter/utils/fonts.dart';
import 'package:example1_flutter/widgets/buttons/button_alert.dart';
import 'package:example1_flutter/widgets/buttons/button_alert_only_border.dart';
import 'package:example1_flutter/widgets/list/list_buttons_social_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'model/user.dart';
import 'widgets/buttons/button.dart';

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
  User user = User("", "", "");
  //SharedPreferences shared  =SharedPreferences();

  Future<void> guardarReferenciaUsuario(String fullname) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('fullname', fullname);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

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
                      Button(
                        onTap: () async {
                          user.fullName = fullNameController.text;
                          user.email = emailController.text;
                          user.password = passController.text;

                          if (user.fullName != "" &&
                              user.email != "" &&
                              user.password != "") {
                            guardarReferenciaUsuario(user.fullName!);
                          }

                          await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    height: 180,
                                    child: Column(children: [
                                      Text("??Est?? seguro de registrarse?",
                                          style: APTextStyle(context)
                                              .titleHaveAcount),
                                      SizedBox(height: 10),
                                      Text("Tus datos de usuario: "),
                                      SizedBox(height: 20),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("Nombre Completo "),
                                              Text(user.fullName!,
                                                  style: APTextStyle(context)
                                                      .titleInputText),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Email "),
                                              Text(user.email!,
                                                  style: APTextStyle(context)
                                                      .titleInputText),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ButtonAlert(
                                            onTap: () {
                                              //Navigator.pop : Permite deshacer ShowDialog
                                              Navigator.pop(
                                                  context); // DESHACER EL SHOWDIALOG

                                              // Navigator.push : Permite sobrepener un Widget
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             HomePage()));

                                              /// Navigator.pushReplacement : Permite  sobreponer un Widget y al mismo tiempo deshacer los anteriores
                                              ///
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const HomePage(),
                                                ),
                                              );
                                            },
                                            text: "Aceptar",
                                            color: Colors.purple[800]!
                                                .withOpacity(0.8),
                                          ),
                                          ButtonAlertOnlyBorder(
                                            color: Colors.purple[800]!,
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            text: "Cancelar",
                                          ),
                                        ],
                                      )
                                    ]),
                                  ),
                                );
                              });
                        },
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 100),
                    child: Row(
                      children: [
                        Text("Alredy have an account?",
                            style: APTextStyle(context).titleHaveAcount),
                        SizedBox(width: 8),
                        Text("Login",
                            style: APTextStyle(context)
                                .titleHaveAcount
                                .copyWith(color: Colors.purple[800]))
                      ],
                    ))
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
                  ? "Su contrase??a debe tener 8 d??gitos"
                  : null;
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure
                          ? Icons.visibility
                          : Icons.visibility_off_rounded,
                      color: Colors.purple[800],
                    )),
                hintText: "Ingrese su password",
                hintStyle: APTextStyle(context)
                    .titleInputText
                    .copyWith(color: Colors.grey.shade500),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple[800]!)),
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
                      borderSide: BorderSide(color: Colors.purple[800]!)),
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
                      borderSide: BorderSide(color: Colors.purple[800]!)),
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

//TAREA : CONSTRUIR UNA PANTALLA DE LOGIN DE USUARIO( INICIAR SESI??N)

// RECOMENDACIONES:

//CREAR VARIABLES
//CREAR CONTROLADORES
//UTILIZAR TEXTFORMFIELDS

//CREAR BOTON " INICIAR SESION"
// MOSTRAR UNA ALERTA -  CON LAS VARIABLES UTILIZADAS
//NAVEGAR A UNA PAGINA NUEVA HOMEPAGE
