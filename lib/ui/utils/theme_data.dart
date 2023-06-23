import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application_colors.dart';

ThemeData hungryHoundTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorPrimaryGreen,
      primary: colorPrimaryGreen,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 3.0,
      shadowColor: colorPrimaryGreen.withOpacity(0.2),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: colorPrimaryGreen
      ),
      titleSpacing: 0.0,
      titleTextStyle: const TextStyle(
        color: colorPrimaryBlack,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2
      ),
      iconTheme: const IconThemeData(color: colorPrimaryGreen)
    ),
    drawerTheme: const DrawerThemeData(
      width: 250,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: colorPrimaryGreen, width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: colorPrimaryGreen, width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      hintStyle: const TextStyle(fontSize: 16.0, color: Colors.grey),
    ),
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => colorPrimaryGreen)
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: colorPrimaryGreen
    )
  );
}

