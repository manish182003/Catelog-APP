import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class mytheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ));

  static ThemeData darktheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);

  static Color creamcolor = Color(0xfff5f5f5);
    static Color darkbluishcolor = Color(0xff403b58);
}
