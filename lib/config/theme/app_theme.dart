import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 239, 88, 19);
const Color _redShade300Color = Color.fromRGBO(229, 115, 115, 1);
const Color _blueShade300Color = Color.fromRGBO(100, 181, 246, 1);
const Color _greenShade300Color = Color.fromRGBO(129, 199, 132, 1);

const List<Color> _colors = [
  _customColor,
  _blueShade300Color,
  _greenShade300Color,
  _redShade300Color,
];

class AppTheme {
  AppTheme({this.colorIndex = 0})
      : assert(colorIndex >= 0 && colorIndex <= _colors.length - 1,
            "Color index must be between 0 and ${_colors.length - 1}");

  final int colorIndex;

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colors[colorIndex],
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
          displayMedium: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
          displaySmall: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ));
  }
}
