import 'package:Drushya/Firebase/login.dart';
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
      home: LoginPage()
    );
  }
}
