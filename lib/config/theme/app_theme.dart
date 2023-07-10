import 'package:flutter/material.dart';

  const listColorsForTheme = <Color>[
    Colors.red,
    Colors.teal,
    Colors.pink,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pinkAccent,
    Colors.deepOrange,
  ];

class AppTheme{
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0, 'Selected color must be greater then 0'),
      assert(selectedColor < listColorsForTheme.length, 'Selected color must be less or equal than ${listColorsForTheme.length - 1} then 0');

  ThemeData getThemeApp() => ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: false
    ),
    colorSchemeSeed: listColorsForTheme[selectedColor]
  );

}