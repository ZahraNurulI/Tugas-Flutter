import 'package:flutter/material.dart';

class AppLightTheme {
  final primarySwatch = Colors.pink;
  final appBarTheme = const AppBarTheme(
    backgroundColor: Color(0xFFAB47BC),
    titleTextStyle: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
    )
  );
  final scaffoldBackgroundColor = Colors.white;
}

class AppDarkTheme {
  final primarySwatch = Colors.pink;
  final appBarTheme = const AppBarTheme(
      backgroundColor: Color(0xFF4527A0),
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
      )
  );
  final scaffoldBackgroundColor = const Color(0xFF7E57C2);
}