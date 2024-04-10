import 'package:flutter/material.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    dividerColor: Color.fromRGBO(142, 142, 147, 1),
    dividerTheme: const DividerThemeData(
        color: Color.fromRGBO(142, 142, 147, 1), thickness: 0.5),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: Colors.white,
        iconTheme: IconThemeData(color: AppColorsLightTheme.textColor),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
            color: AppColorsLightTheme.textColor,
            fontFamily: _Fonts.regular,
            fontSize: 20)),
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColorsLightTheme.textColor)),
        outlineBorder: BorderSide(color: AppColorsLightTheme.textColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: false,
        activeIndicatorBorder: BorderSide(color: AppColors.primary),
        counterStyle: TextStyle(color: AppColors.primary),
        fillColor: Color.fromRGBO(243, 243, 243, 1),
        focusColor: Colors.red,
        hoverColor: Colors.red,
        labelStyle: TextStyle(
            color: AppColorsLightTheme.textColor, fontFamily: _Fonts.regular)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColorsLightTheme.scaffoldBackgroundColor,
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
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.normal),
        displayMedium: TextStyle(
            fontSize: 45,
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.normal),
        displaySmall: TextStyle(
            fontSize: 36,
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.normal),
        headlineLarge: TextStyle(
            fontSize: 34, // 32
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.normal),
        headlineMedium: TextStyle(
            fontSize: 30, // 28
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.normal),
        headlineSmall: TextStyle(
            fontSize: 26, // 24
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.normal),
        titleLarge: TextStyle(
            fontSize: 24, // 22
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            fontSize: 18, // 16
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            fontSize: 16, // 14
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.w500),
        labelLarge: TextStyle(
            fontSize: 16, // 14
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.w500),
        labelMedium: TextStyle(
            fontSize: 14, // 12
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.w500),
        labelSmall: TextStyle(
            fontSize: 13, // 11
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            fontSize: 18, // 16
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(
            fontSize: 16, // 14
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.normal),
        bodySmall: TextStyle(
            fontSize: 14, // 12
            fontFamily: _Fonts.regular,
            color: AppColorsLightTheme.textColor,
            fontWeight: FontWeight.normal)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary, foregroundColor: Colors.white),
    indicatorColor: AppColors.primary,
    iconTheme: const IconThemeData(color: AppColorsLightTheme.textColor),
    drawerTheme: const DrawerThemeData(
      elevation: 0,
      shadowColor: Colors.white,
      backgroundColor: AppColorsLightTheme.scaffoldBackgroundColor,
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: AppColorsLightTheme.scaffoldBackgroundColor,
      selectedTileColor: AppColorsLightTheme.scaffoldBackgroundColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColorsLightTheme.scaffoldBackgroundColor,
      titleTextStyle: TextStyle(
          color: AppColorsLightTheme.textColor,
          fontFamily: _Fonts.regular,
          fontSize: 20),
      contentTextStyle: TextStyle(
          color: AppColorsLightTheme.textColor,
          fontFamily: _Fonts.regular,
          fontSize: 16),
    ),
    colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColorsLightTheme.secondaryTextColor,
        surface: Colors.white,
        background: Colors.white,
        error: AppColors.errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white),
  );
  static var darkTheme = ThemeData(
    dividerColor: Color.fromRGBO(142, 142, 147, 1),
    dividerTheme: const DividerThemeData(
        color: Color.fromRGBO(142, 142, 147, 1), thickness: 0.5),
    scaffoldBackgroundColor: AppColorsDarkTheme.scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: AppColorsDarkTheme.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: AppColorsDarkTheme.textColor),
        backgroundColor: AppColorsDarkTheme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
            color: AppColorsDarkTheme.textColor,
            fontFamily: _Fonts.regular,
            fontSize: 20)),
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColorsDarkTheme.textColor)),
        outlineBorder: BorderSide(color: AppColorsDarkTheme.textColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: false,
        activeIndicatorBorder: BorderSide(color: AppColors.primary),
        counterStyle: TextStyle(color: AppColors.primary),
        fillColor: AppColorsDarkTheme.scaffoldBackgroundColor,
        focusColor: Colors.red,
        hoverColor: Colors.red,
        labelStyle: TextStyle(
            color: AppColorsDarkTheme.textColor, fontFamily: _Fonts.regular)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColorsDarkTheme.scaffoldBackgroundColor,
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
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.normal),
        displayMedium: TextStyle(
            fontSize: 45,
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.normal),
        displaySmall: TextStyle(
            fontSize: 36,
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.normal),
        headlineLarge: TextStyle(
            fontSize: 34, // 32
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.normal),
        headlineMedium: TextStyle(
            fontSize: 30, // 28
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.normal),
        headlineSmall: TextStyle(
            fontSize: 26, // 24
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.normal),
        titleLarge: TextStyle(
            fontSize: 24, // 22
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            fontSize: 18, // 16
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            fontSize: 16, // 14
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.w500),
        labelLarge: TextStyle(
            fontSize: 16, // 14
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.w500),
        labelMedium: TextStyle(
            fontSize: 14, // 12
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.w500),
        labelSmall: TextStyle(
            fontSize: 13, // 11
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            fontSize: 18, // 16
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(
            fontSize: 16, // 14
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.normal),
        bodySmall: TextStyle(
            fontSize: 14, // 12
            fontFamily: _Fonts.regular,
            color: AppColorsDarkTheme.textColor,
            fontWeight: FontWeight.normal)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary, foregroundColor: Colors.white),
    indicatorColor: AppColors.primary,
    iconTheme: const IconThemeData(color: AppColorsDarkTheme.textColor),
    drawerTheme: const DrawerThemeData(
      elevation: 0,
      shadowColor: Colors.white,
      backgroundColor: AppColorsDarkTheme.scaffoldBackgroundColor,
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: AppColorsDarkTheme.scaffoldBackgroundColor,
      selectedTileColor: AppColorsDarkTheme.scaffoldBackgroundColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColorsDarkTheme.scaffoldBackgroundColor,
      titleTextStyle: TextStyle(
          color: AppColorsDarkTheme.textColor,
          fontFamily: _Fonts.regular,
          fontSize: 20),
      contentTextStyle: TextStyle(
          color: AppColorsDarkTheme.textColor,
          fontFamily: _Fonts.regular,
          fontSize: 16),
    ),
    colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColorsDarkTheme.secondaryTextColor,
        surface: AppColorsDarkTheme.scaffoldBackgroundColor,
        background: AppColorsDarkTheme.scaffoldBackgroundColor,
        error: AppColors.errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white),
  );
}

class AppColors {
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

class AppColorsLightTheme {
  static const scaffoldBackgroundColor = Colors.white;
  static const textColor = Colors.black;
  static const secondaryTextColor = Color.fromRGBO(86, 99, 111, 1);
}

class AppColorsDarkTheme {
  static const scaffoldBackgroundColor = Color.fromRGBO(43, 43, 43, 1);
  static const textColor = Colors.white;
  static const secondaryTextColor = Color.fromRGBO(95, 103, 110, 1.0);
}

class _Fonts {
  static const regular = "SF";
}
