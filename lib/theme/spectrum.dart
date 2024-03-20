import 'package:flutter/material.dart';

class Spectrum {
  //Colors
  static const blackColor = Colors.black;
  static const blackColor2 = Colors.black54;
  static const whiteColor = Colors.white;
  static const whiteColor2 = Colors.white30;
  static const whiteColor3 = Colors.white38;
  static const redColor = Colors.red;
  static const mychatgptColor =
      Color.fromRGBO(52, 53, 65, 1); //  rgb(52 53 65);
  static const mablackchatgptColor = Color.fromRGBO(64, 65, 79, 1);
  static const answergpt = Color.fromRGBO(172, 172, 190, 0.25);
  static const signUpBackground = Color.fromRGBO(0, 0, 46, 1);

  static const purpleColor = Colors.purple;

  //Dark Mode
  static final darkMode = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );

  // Light Mode
  static final lightMode = ThemeData.light();
}
