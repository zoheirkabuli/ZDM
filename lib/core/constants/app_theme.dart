import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zdm/core/constants/app_colors.dart';

class AppTheme {
  // return ThemeData
  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      color: AppColors.primary,
      titleTextStyle: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      actionsIconTheme: const IconThemeData(color: Colors.white),
    ),
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
}
