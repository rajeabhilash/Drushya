import 'package:Drushya/Neumorphism/NeuTheme.dart';
import 'package:Drushya/Widgets/DmDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Neumorphism/NeuHome.dart';

void main() async {
  runApp(const StartDrushya());
}

class StartDrushya extends StatelessWidget {
  const StartDrushya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return NeuThemeProvider();
      },
      builder: (context, _) {
        final themeProvider = Provider.of<NeuThemeProvider>(context);
        return MaterialApp(
          title: "Drushya App",
          // themeMode: ThemeMode.dark,
          themeMode: themeProvider.themeMode,
          theme: NeuTheme.lightTheme,
          darkTheme: NeuTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: DmDrawer(),
        );
      },
    );
  }
}
