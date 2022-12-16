import 'package:example1_flutter/register_screen.dart';
import 'package:example1_flutter/utils/fonts.dart';
import 'package:example1_flutter/widgets/buttons/button_alert.dart';
import 'package:example1_flutter/widgets/buttons/button_alert_only_border.dart';
import 'package:example1_flutter/widgets/buttons/buttons_list.dart';
import 'package:example1_flutter/widgets/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_drawer.dart';

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
  Future<void> checkPreferencesUser() async {
    final prefs = await SharedPreferences.getInstance();
    fullname = prefs.getString('fullname');
    print(fullname);
  }

  dynamic navigateToRoute() {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => RegisterScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(actions: [
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
                            onTap: () async {
                              //Navigator.pushAndRemoveUntil :  Permite navegar a un nuevo Screen y remover las anteriores
                              navigateToRoute();
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
      ], title: Text("Pantalla Principal")),
      drawer: Drawer(child: MainDrawer()),
      body: ButtonsList(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => theme.setTheme(ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.green))),
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
