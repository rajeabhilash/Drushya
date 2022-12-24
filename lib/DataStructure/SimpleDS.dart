import 'package:flutter/material.dart';

class SimpleDS extends StatelessWidget {
  SimpleDS({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Text("Data Structure"),
      ),
      drawer: Drawer(),
      body: Center(
        child: GestureDetector(
          onTap: ()=> _key.currentState!.openDrawer(),
          child: Text("Simple DB"),
        ),
      ),
    );
  }
}
