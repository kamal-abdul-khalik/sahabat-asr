import 'package:google_fonts/google_fonts.dart';
import 'package:kta_asr/shared/theme/theme_config.dart';
import 'package:flutter/material.dart';

ThemeData getDefaultTheme() {
  return ThemeData().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: appbarBackgroundColor,
      elevation: 0.6,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blueGrey[900]!,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      titleMedium: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      titleLarge: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      bodyLarge: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      bodySmall: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      bodyMedium: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
    ),
  );
}
