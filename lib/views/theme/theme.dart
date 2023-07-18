import 'package:flutter/material.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            color: Colors.black, fontFamily: _Fonts.regular, fontSize: 20)),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
      fillColor: Color.fromRGBO(243, 243, 243, 1),
      focusColor: Colors.red,
      hoverColor: Colors.red,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _Colors.mainDarkBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    fontFamily: _Fonts.regular,
    primaryColor: _Colors.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
      if (s.contains(MaterialState.disabled)) return Colors.grey;
      return const Color.fromRGBO(76, 144, 243, 1);
    }), foregroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
      return Colors.white;
    }), shadowColor: MaterialStateProperty.resolveWith<Color?>((s) {
      return Colors.transparent;
    }), elevation: MaterialStateProperty.resolveWith<double?>((s) {
      return 0;
    }), textStyle: MaterialStateProperty.resolveWith<TextStyle?>((s) {
      return const TextStyle(
          fontSize: 16, fontFamily: _Fonts.regular, color: Colors.white);
    }))),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>((s) {
        return const TextStyle(
            fontSize: 16, fontFamily: _Fonts.regular, color: Colors.white);
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
        if (s.contains(MaterialState.disabled)) return Colors.grey;
        return Colors.transparent;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
        return const Color.fromRGBO(76, 144, 243, 1);
      }),
    )),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 57,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        displayMedium: TextStyle(
            fontSize: 45,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        displaySmall: TextStyle(
            fontSize: 36,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        headlineLarge: TextStyle(
            fontSize: 32,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        headlineMedium: TextStyle(
            fontSize: 28,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        headlineSmall: TextStyle(
            fontSize: 24,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        titleLarge: TextStyle(
            fontSize: 22,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            fontSize: 16,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            fontSize: 14,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        labelLarge: TextStyle(
            fontSize: 14,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        labelMedium: TextStyle(
            fontSize: 12,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        labelSmall: TextStyle(
            fontSize: 11,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            fontSize: 16,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(
            fontSize: 14,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        bodySmall: TextStyle(
            fontSize: 12,
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal)),
  );
  static var darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: _Colors.mainDarkBlue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _Colors.mainDarkBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    fontFamily: _Fonts.regular,
  );
}

class _Colors {
  static const mainDarkBlue = Color.fromRGBO(3, 37, 65, 1);
  static const primary = Color.fromRGBO(76, 144, 243, 1);
  static const buttonBackgroundColor = Color.fromRGBO(76, 144, 243, 1);
  static const buttonTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const buttonNoBackgroundTextColor = Color.fromRGBO(255, 255, 255, 1);
  static var textButtonStyle = TextButton.styleFrom(
      foregroundColor: buttonTextColor, backgroundColor: buttonBackgroundColor);
}

class _Fonts {
  static const regular = "SF";
}
