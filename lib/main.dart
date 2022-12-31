import 'package:Drushya/Neumorphism/NeuHome.dart';
import 'package:Drushya/Neumorphism/NeuTheme.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const StartDrushya());
}

class StartDrushya extends StatelessWidget {
  const StartDrushya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drushya App",
      themeMode: ThemeMode.dark,
      theme: NeuTheme.lightTheme,
      darkTheme: NeuTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}