import 'package:flutter/material.dart';

class DmDrawer extends StatelessWidget {
  const DmDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(child: Text("Drawer Header"), decoration: BoxDecoration(color: Colors.teal),),
          ListTile(title: Text("Addya Padya"),),
          ListTile(title: Text("Pungat Padya"),)
        ],
      ),
    );
  }
}
