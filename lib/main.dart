import 'package:Drushya/DataStructure/SimpleDS.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const StartDrushya());
}

class StartDrushya extends StatelessWidget {
  const StartDrushya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drushya App",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: SimpleDS()
    );
  }
}