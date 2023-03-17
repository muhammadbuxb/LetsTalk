import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  ThemeData lightTheme = ThemeData(
    // fontFamily: GoogleFonts.fanwoodText().fontFamily,
    primarySwatch: Colors.deepPurple,
    secondaryHeaderColor: Colors.yellowAccent,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
    ),

  );

  ThemeData darkTheme = ThemeData(

    // fontFamily: GoogleFonts.fanwoodText().fontFamily,
    primarySwatch: Colors.deepPurple,
    secondaryHeaderColor:Colors.yellowAccent,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellowAccent,
      foregroundColor: Colors.deepPurple,
      iconTheme: const IconThemeData(color: Colors.white),
    ),

  );
}
