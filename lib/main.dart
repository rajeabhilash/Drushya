import 'package:drushya/Widgets/TabAndDrawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StartDushya());
}

class StartDushya extends StatelessWidget {
  const StartDushya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sarav App",
      debugShowCheckedModeBanner: false,
      home: TabAndDrawer()
    );
  }
}
