// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

ThemeData AppTheme() {
  return ThemeData().copyWith(
    primaryColor: Colors.orangeAccent,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      headline2: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Colors.black,
      ),
      headline3: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Colors.green,
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Colors.orangeAccent,
      ),
      headline5: TextStyle(
        fontSize: 13,
        color: Colors.grey,
      ),
    ),
  );
}
