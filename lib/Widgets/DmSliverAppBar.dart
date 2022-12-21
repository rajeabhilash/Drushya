import 'package:flutter/material.dart';

class DmSliverAppBar extends StatelessWidget {
  const DmSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 80,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Flexible Space Bar"),
            centerTitle: true,
          ),
        ),
        SliverList(delegate: SliverChildListDelegate([
          Container(width: 300, height: 400, color: Colors.red,),
          Container(width: 300, height: 400, color: Colors.green,),
          Container(width: 300, height: 400, color: Colors.blue,),
          Container(width: 300, height: 400, color: Colors.orange,),
        ]))
      ],
    );
  }
}
