import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

ThemeData getDarkTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0.6,
      titleTextStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(),
      bodySmall: GoogleFonts.poppins(),
      bodyMedium: GoogleFonts.poppins(),
    ),
  );
}
