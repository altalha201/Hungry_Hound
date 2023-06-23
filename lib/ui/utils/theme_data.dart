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
    )
  );
}

