import 'package:Drushya/init/start.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const StartDrushya());
}

class StartDrushya extends StatelessWidget {
  const StartDrushya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drushya Tantradhnyan",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
      ),
      home: const Start(),
    );
  }
}
