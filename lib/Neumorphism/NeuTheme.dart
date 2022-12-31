import 'package:flutter/material.dart';

class NeuThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class NeuTheme {
  static final darkTheme = ThemeData(
    // colorScheme: ColorScheme.dark(),
    brightness: Brightness.dark,
  );

  static final lightTheme = ThemeData(
    // colorScheme: ColorScheme.light(),
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
  );
}
