import 'package:flutter/material.dart';

enum AppTheme {
  LightAppTheme,
  DarkAppTheme,
}

final appThemeData = {
  AppTheme.DarkAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.black,
    backgroundColor:  Colors.brown ,
    textTheme: TextTheme(
      bodyText2:  const TextStyle().copyWith(color: Colors.white),
      bodyText1:  const TextStyle().copyWith(color: Colors.yellowAccent),

    ),
  ),
  AppTheme.LightAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor:  Colors.amber ,
    textTheme: TextTheme(
      bodyText2: const TextStyle().copyWith(color: Colors.white),
      bodyText1: const TextStyle().copyWith(color: Colors.black),
    ),
  ),
};



