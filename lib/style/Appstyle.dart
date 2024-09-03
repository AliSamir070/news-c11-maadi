import 'package:flutter/material.dart';

class AppStyle{
  static Color lightPrimary = Color(0xff39A552);
  static Color lightBlackText = Color(0xff303030);
  static Color categoriesTitleColor = Color(0xff4F5A69);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimary,
        primary: lightPrimary,
        secondary: lightBlackText
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: categoriesTitleColor,
        fontSize: 22,
        fontWeight: FontWeight.w700
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 24
      )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightPrimary,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        )
      ),
      titleTextStyle:  const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        color: Colors.white
      )
    )
  );
}