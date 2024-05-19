import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      useMaterial3: true,
      textTheme: GoogleFonts.barlowTextTheme(),
      appBarTheme: AppBarTheme(color: Colors.black),
      cardTheme: CardTheme(
        elevation: 8,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
  );
}
