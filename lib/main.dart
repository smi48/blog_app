import 'package:blog_app/constans/styles/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/tabs/tab_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0)),
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          appBarTheme: const AppBarTheme(
              backgroundColor: BlogAppColors.appBarBg,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: BlogAppColors.iconActive))),
      home: const TabRouter(),
    );
  }
}
