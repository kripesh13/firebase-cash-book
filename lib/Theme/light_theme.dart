import 'package:flutter/material.dart';

import '../res/barrel_file.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  hintColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(color: blackColor),
  appBarTheme: AppBarTheme(
    color: Colors.white, // Appbar color
    iconTheme: IconThemeData(color: primaryColor),
    // Icon color
    foregroundColor: Colors.black,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white, // BottomNavBar color
    selectedItemColor: Colors.teal, // Selected item color
    unselectedItemColor: Colors.grey, // Unselected item color
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.teal, // FAB color
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.teal, // Button color
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    bodyLarge:
        TextStyle(color: Colors.grey[800], fontSize: 14), // Body text color
    bodyMedium: TextStyle(color: Colors.grey[700], fontSize: 12),
    bodySmall: TextStyle(color: Colors.grey, fontSize: 10),
    titleSmall: TextStyle(color: Colors.grey[700], fontSize: 10),
    titleMedium:
        TextStyle(color: Colors.grey[800], fontSize: 12), // Subtitle color
    titleLarge: TextStyle(color: Colors.grey, fontSize: 14),
    labelMedium: TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(color: Colors.grey, fontSize: 10),

    labelLarge: TextStyle(color: Colors.grey[800], fontSize: 14),
    // Button text color
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: primaryColor),
    // Change the border color for all InputDecorations
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        )),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: primaryColor, // Change this color to the desired color
        width: 1.0, // Change the border width if needed
      ),
    ),
  ),
);
