import 'package:example1_flutter/profile_page.dart';
import 'package:example1_flutter/utils/fonts.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg?compress=1&resize=1600x1200&vertical=top"),
          ),
          SizedBox(height: 5),
          Text("Lutus Wonderfu",
              style: APTextStyle(context).titleReferenceName),
          SizedBox(height: 5),
          Text("Desarrollador de Apps",
              style:
                  APTextStyle(context).titleHaveAcount.copyWith(fontSize: 12)),
          SizedBox(height: 20),
          Divider(
            color: Colors.blueAccent,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            title: Text("Tu Perfíl"),
            leading: Icon(Icons.person, color: Colors.black),
          ),
          ListTile(
            title: Text("Tus Correos"),
            leading: Icon(Icons.inbox, color: Colors.black),
          ),
          ListTile(
            title: Text("Tus Gráficos"),
            leading: Icon(Icons.assessment, color: Colors.black),
          ),
          ListTile(
            title: Text("Opciones"),
            leading: Icon(Icons.settings, color: Colors.black),
          )
        ],
      ),
    );
  }
}
