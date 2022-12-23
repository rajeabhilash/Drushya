import 'package:flutter/material.dart';
import 'DmDrawer.dart';
import 'DmSliverAppBar.dart';

class TabAndDrawer extends StatelessWidget {
  const TabAndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Sarav App"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(onPressed: (){}, icon: Icon(Icons.abc_sharp)),
              IconButton(onPressed: (){}, icon: Icon(Icons.holiday_village_outlined)),
              IconButton(onPressed: (){}, icon: Icon(Icons.precision_manufacturing)),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(child: Icon(Icons.account_balance_sharp),),
                Tab(child: Icon(Icons.add_alert),),
                Tab(child: Icon(Icons.ad_units_rounded),),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.add_a_photo),
          ),
          drawer: DmDrawer(),
          body: TabBarView(
            children: <Widget>[
              PageView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(color: Colors.red,),
                  Container(color: Colors.green,),
                  Container(color: Colors.blue,),
                ],
              ),
              DmSliverAppBar(),
              Center(child: Text("AddUnit Bar"),),
            ],
          )
      ),
    );
  }
}
