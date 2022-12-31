import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeText =
        MediaQuery.of(context).platformBrightness == Brightness.light
            ? "Light Theme"
            : "Dark Theme";

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text(themeText),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(Icons.account_balance_sharp)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible_forward), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.paragliding_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: "Home"),
        ],
      ),
    );
  }
}
