import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Drushya/Neumorphism/NeuTheme.dart';

class AnimeHome extends StatefulWidget {
  const AnimeHome({Key? key}) : super(key: key);

  @override
  State<AnimeHome> createState() => _AnimeHomeState();
}

class _AnimeHomeState extends State<AnimeHome>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Animation colorAnimation;
  bool isForward = true;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    animation = Tween<double>(begin: 250.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    colorAnimation = ColorTween(begin: Colors.blueGrey, end: Colors.yellow)
        .animate(controller);
    // animation = Tween<double>(begin: 250.0, end: 100.0).animate(controller);
    // controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Provider.of<NeuThemeProvider>(context).themeMode == ThemeMode.dark
            ? true
            : false;
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (isForward) {
              controller.forward();
              isForward = isForward ? false : true;
            } else {
              controller.reverse();
              isForward = isForward ? false : true;
            }
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 250,
              width: 250,
              child: Center(
                child: AnimatedBuilder(
                  // pass our AnimationController as the animation argument
                  animation: controller,
                  // pass the child widget that we will animate
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    padding: EdgeInsets.all(10),
                  ),
                  // add a builder argument
                  builder: (context, child) {
                    // use a Transform widget to apply a rotation
                    return Transform.rotate(
                      // the angle is a function of the AnimationController's value
                      angle: 0.5 * pi * controller.value,
                      child: child,
                    );
                  },
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          child: isDark ? Icon(Icons.sunny) : Icon(Icons.nightlight),
          onPressed: () {
            final provider =
                Provider.of<NeuThemeProvider>(context, listen: false);
            isDark = isDark ? false : true;
            provider.toggleTheme(isDark);
          }),
    );
  }
}
