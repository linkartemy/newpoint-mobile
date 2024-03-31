import 'package:flutter/material.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    dividerColor: Color.fromRGBO(142, 142, 147, 1),
    dividerTheme: const DividerThemeData(
      color: Color.fromRGBO(142, 142, 147, 1),
      thickness: 0.5
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontFamily: _Fonts.regular, fontSize: 20)),
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: false,
        activeIndicatorBorder: BorderSide(color: AppColors.primary),
        counterStyle: TextStyle(color: AppColors.primary),
        fillColor: Color.fromRGBO(243, 243, 243, 1),
        focusColor: Colors.red,
        hoverColor: Colors.red,
        labelStyle:
            TextStyle(color: AppColors.textColor, fontFamily: _Fonts.regular)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.mainDarkBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    fontFamily: _Fonts.regular,
    primaryColor: AppColors.primary,
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
            fontSize: 34, // 32
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        headlineMedium: TextStyle(
            fontSize: 30, // 28
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        headlineSmall: TextStyle(
            fontSize: 26, // 24
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        titleLarge: TextStyle(
            fontSize: 24, // 22
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            fontSize: 18, // 16
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            fontSize: 16, // 14
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        labelLarge: TextStyle(
            fontSize: 16, // 14
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        labelMedium: TextStyle(
            fontSize: 14, // 12
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        labelSmall: TextStyle(
            fontSize: 13, // 11
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            fontSize: 18, // 16
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(
            fontSize: 16, // 14
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal),
        bodySmall: TextStyle(
            fontSize: 14, // 12
            fontFamily: _Fonts.regular,
            color: Colors.black,
            fontWeight: FontWeight.normal)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary, foregroundColor: Colors.white),
    indicatorColor: AppColors.primary,
  );
  static var darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainDarkBlue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.mainDarkBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    fontFamily: _Fonts.regular,
  );
}

class AppColors {
  static const mainDarkBlue = Color.fromRGBO(3, 37, 65, 1);
  static const primary = Color.fromRGBO(76, 144, 243, 1);
  static const buttonBackgroundColor = Color.fromRGBO(76, 144, 243, 1);
  static const buttonTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const buttonNoBackgroundTextColor = Color.fromRGBO(255, 255, 255, 1);
  static var textButtonStyle = TextButton.styleFrom(
      foregroundColor: buttonTextColor, backgroundColor: buttonBackgroundColor);
  static const likeButtonColor = Colors.pink;
  static const textColor = Colors.black;
  static const secondaryTextColor = Color.fromRGBO(86, 99, 111, 1);
  static const secondaryTextColorOnBlueBg = Color.fromRGBO(239, 239, 239, 1.0);
  static const successColor = Colors.green;
  static const errorColor = Colors.red;
}

class _Fonts {
  static const regular = "SF";
}
