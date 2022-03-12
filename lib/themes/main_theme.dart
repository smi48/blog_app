import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constans/styles/colors_const.dart';

ThemeData mainTheme() {
  return ThemeData(
      fontFamily: GoogleFonts.roboto().fontFamily,
      appBarTheme: const AppBarTheme(
          backgroundColor: BlogAppColors.appBarBg,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: BlogAppColors.iconActive)));
}
