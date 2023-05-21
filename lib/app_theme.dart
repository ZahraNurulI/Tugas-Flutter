import 'package:flutter/material.dart';

class AppLightTheme {
  final primarySwatch = Colors.blue;
  final appBarTheme = const AppBarTheme(
    backgroundColor: Color(0xFF7986CB),
    titleTextStyle: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
    )
  );
  final scaffoldBackgroundColor = Colors.white;
}

class AppDarkTheme {
  final primarySwatch = Colors.blueGrey;
  final appBarTheme = const AppBarTheme(
      backgroundColor: Color(0xFF90A4AE),
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
      )
  );
  final scaffoldBackgroundColor = Colors.black;
}