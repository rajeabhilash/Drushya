import 'package:Drushya/Neumorphism/NeuTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NeuThemeChangerSwitch extends StatelessWidget {
  const NeuThemeChangerSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<NeuThemeProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<NeuThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
