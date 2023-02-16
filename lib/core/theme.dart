import 'package:flutter/material.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.teal,
    ),
    textTheme: TextTheme(
        headline6: TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500)),
  );
}
