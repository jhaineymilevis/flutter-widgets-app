import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.orange,
  Colors.brown,
  Colors.lightGreen,
  Colors.lightBlue,
  Colors.lightGreen,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be grater than zero'),
        assert(selectedColor < colorList.length,
            'Selected color must be lest or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: true));
}
