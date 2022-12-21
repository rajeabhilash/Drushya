import 'package:flutter/material.dart';

void main() {
  runApp(const StartDrushya());
}

class StartDrushya extends StatelessWidget {
  const StartDrushya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Drushya App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text("Welcome, Drushya Here.!!"),),
      ),
    );
  }
}
