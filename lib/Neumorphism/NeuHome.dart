import 'package:Drushya/Neumorphism/NeuTheme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    bool isDark =
        Provider.of<NeuThemeProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;

    return Scaffold(
        key: _key,
        drawer: const Drawer(),
        body: Container(
            child: Center(
                child: Container(
          width: 500.0,
          height: 500.0,
          color: Theme.of(context).scaffoldBackgroundColor,
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          child: Container(
            width: 200,
            height: 200,
            child: Icon(
              Icons.star,
              size: 67,
              color: Theme.of(context).hintColor,
            ),
            decoration: BoxDecoration(
              color: isDark
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Color(0xffffeeee),
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).scaffoldBackgroundColor,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark ? Color(0xff515151) : Color(0xffd1d0d0),
                  //Color(0xffefeee),
                  offset: Offset(-20.0, -20.0),
                  blurRadius: 30,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: isDark ? Color(0xff151515) : Color(0xffd1d0d0),
                  offset: Offset(20.0, 20.0),
                  blurRadius: 30,
                  spreadRadius: 0.0,
                ),
              ],
            ),
          ),
        ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          child: isDark ? Icon(Icons.sunny) : Icon(Icons.nightlight),
          // label: const Text('Add a task'),
          onPressed: () {
            final provider =
                Provider.of<NeuThemeProvider>(context, listen: false);
            isDark = isDark ? false : true;
            provider.toggleTheme(isDark);
          },
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 4,
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
              ),
              // const Spacer(),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
