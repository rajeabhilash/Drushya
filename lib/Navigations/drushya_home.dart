import 'package:flutter/material.dart';

class DrushyaHome extends StatefulWidget {
  const DrushyaHome({super.key});

  @override
  State<DrushyaHome> createState() => _DrushyaHomeState();
}

class _DrushyaHomeState extends State<DrushyaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text("Submit"))
        ],
      )),
    );
  }
}
