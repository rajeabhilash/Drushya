import 'package:Drushya/DataStructure/DynamicList.dart';
import 'package:Drushya/DataStructure/SimpleList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleDS extends StatefulWidget {
  SimpleDS({Key? key}) : super(key: key);

  @override
  State<SimpleDS> createState() => _SimpleDSState();
}

class _SimpleDSState extends State<SimpleDS> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  PageController _pageController = PageController();

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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  image: DecorationImage(
                      image: AssetImage("images/DSDrawerHeader.jpg"),
                      fit: BoxFit.fill,
                      opacity: 0.4,
                      scale: 2),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  child: Text(
                    "Choose Data Structure ",
                    style: GoogleFonts.exo(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Simple List'),
                onTap: () {
                  _pageController.jumpToPage(0);
                  Scaffold.of(context).closeDrawer();
                },
              ),
              ListTile(
                title: const Text('Dynamic List'),
                onTap: () {
                  _pageController.jumpToPage(1);
                  Scaffold.of(context).closeDrawer();
                },
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: [
            SimpleList(product: List<String>.generate(25, (index) => "$index")),
            DynamicList(),
            Container(color: Colors.green),
            Container(color: Colors.red),
          ],
        ));
  }
}
