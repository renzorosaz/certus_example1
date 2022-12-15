import 'package:example1_flutter/register_screen.dart';
import 'package:example1_flutter/utils/fonts.dart';
import 'package:example1_flutter/widgets/buttons/button_alert.dart';
import 'package:example1_flutter/widgets/buttons/button_alert_only_border.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? fullname;

  //
  @override
  void initState() {
    checkPreferencesUser();
    super.initState();
  }

  //FUNCION PARA VALIDAR, REVISAR O VERIFICAR LAS PREFERENCIAS DE USUARIO
  void checkPreferencesUser() async {
    final prefs = await SharedPreferences.getInstance();
    fullname = prefs.getString('fullname');
    print(fullname);
  }

  Future<void> getProductos() async {}

  Future<void> listarClientes() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.drag_handle_rounded),
          actions: [
            GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(fullname!,
                                style: APTextStyle(context)
                                    .titleReferenceName
                                    .copyWith(color: Colors.blue)),
                            Text("¿Desea cerrar sesión?"),
                          ],
                        )),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonAlert(
                                color: Colors.blueAccent,
                                onTap: () {
                                  //Navigator.pushAndRemoveUntil :  Permite navegar a un nuevo Screen y remover las anteriores
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              RegisterScreen()),
                                      (route) => false);
                                },
                                text: "Aceptar",
                              ),
                              ButtonAlertOnlyBorder(
                                color: Colors.blueAccent,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                text: "Cancelar",
                              )
                            ],
                          )
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(Icons.exit_to_app),
              ),
            )
          ],
          automaticallyImplyLeading: false,
          title: Text("Pantalla Principal")),
    );
  }
}
