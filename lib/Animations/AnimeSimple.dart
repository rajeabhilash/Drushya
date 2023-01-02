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
            controller.forward();
          },
          child: Container(
            decoration: BoxDecoration(
                color: colorAnimation.value,
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: animation.value,
            width: animation.value,
            child: const FlutterLogo(),
          ),
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
