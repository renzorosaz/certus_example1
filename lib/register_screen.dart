import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

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
                // WIDGET PADRE QUE CONTIENE LISTA DE WIDETS HORIZONTALMENTE
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("Register",
                      style: GoogleFonts.nunito(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Register to continue",
                      style: GoogleFonts.nunito(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 20,
                  ),
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
                        child: Icon(FontAwesomeIcons.google,
                            color: Colors.yellow[700]),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(FontAwesomeIcons.instagram,
                            color: Colors.red[300]),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text("o Register with Email",
                      style: GoogleFonts.nunito(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500)),
                ]),
          ),
        ),
      ),
    );
  }
}
