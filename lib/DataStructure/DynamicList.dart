import 'package:flutter/material.dart';

class DynamicList extends StatefulWidget {
  const DynamicList({Key? key}) : super(key: key);

  @override
  State<DynamicList> createState() => _DynamicListState();
}

class _DynamicListState extends State<DynamicList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
      child: Center(child: Text("DynamicList"),),
    );
  }
}
