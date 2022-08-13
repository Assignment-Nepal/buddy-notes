import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // Set Color
    backgroundColor: const Color(0xFFEAF4FE),
    // primaryColor: AppColors.lightPrimary,
    // accentColor: AppColors.lightAccent,
    // hintColor: Color(0xff585858),
    // canvasColor: Colors.transparent,
    // scaffoldBackgroundColor: AppColors.lightBG,

    // Set UI Theme
    appBarTheme: appBarTheme,
    textSelectionTheme: textSelectionTheme,
    buttonTheme: bottomTheme,
    floatingActionButtonTheme: floatingButtonTheme,

    textTheme: const TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 45 / 3,
          color: Colors.black,
        ),
        headline3: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 40,
          color: Colors.black,
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 35 / 3,
          color: Color(0xff585858),
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 40 / 3,
          color: Colors.black,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 45 / 3,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 35 / 3,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 35 / 3,
          color: Colors.grey,
        ),
        subtitle1: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 36 / 3,
          color: Color(0xff9F9F9F),
        ),
        subtitle2: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 35 / 3,
          color: Color(0xff9F9F9F),
        )),
  );

  TextStyle bold24Roboto = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  /// App Theme
  static AppBarTheme appBarTheme = const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
  );

  /// FloatingButton Theme
  static FloatingActionButtonThemeData floatingButtonTheme =
      const FloatingActionButtonThemeData(
    backgroundColor: Color(0xffffffff),
  );

  /// Button Theme
  static ButtonThemeData bottomTheme = ButtonThemeData(
    buttonColor: const Color(0xff3b9dda),
    height: 51,
    textTheme: ButtonTextTheme.primary,
    padding: const EdgeInsets.symmetric(horizontal: 40),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular((16)),
    ),
  );

  /// Text Selection Theme
  static TextSelectionThemeData textSelectionTheme =
      const TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.black,
  );
}
