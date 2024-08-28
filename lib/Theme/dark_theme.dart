import 'package:flutter/material.dart';

import '../res/barrel_file.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkGrey,
  iconTheme: IconThemeData(
    color: whiteColor,
  ),
  shadowColor: greyColor,
  cardTheme: CardTheme(color: darkGrey, shadowColor: greyColor),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: greyColor),
  datePickerTheme: DatePickerThemeData(backgroundColor: greyColor),
  indicatorColor: primaryColor,
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(darkGrey),
      backgroundColor: MaterialStateProperty.all(greyColor),
    ),
  ),
  primaryColorDark: darkGrey,
  primaryTextTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white, fontSize: 12),
  ),
  primaryColor: primaryColor,
  appBarTheme: AppBarTheme(
    color: Color(0xff303131),
    iconTheme: IconThemeData(color: Colors.white),
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff303131),
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey[400],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: primaryColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: primaryColor,
        width: 1.0,
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 14),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 12),
    bodySmall: TextStyle(color: Colors.white, fontSize: 10),
    titleMedium: TextStyle(color: Colors.white, fontSize: 12),
    titleSmall: TextStyle(color: Colors.white, fontSize: 10),
    titleLarge: TextStyle(color: Colors.white, fontSize: 14),
    labelMedium: TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(color: Colors.white, fontSize: 10),
    labelLarge: TextStyle(color: Colors.white, fontSize: 14),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: TextStyle(color: whiteColor),
    menuStyle: MenuStyle(
      backgroundColor: MaterialStateProperty.all(darkGrey),
    ),
  ), bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey[700]),
);
