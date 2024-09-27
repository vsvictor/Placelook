
import 'package:flutter/material.dart';

import 'map_extension.dart';

var plDarkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xff1D1617),
  textTheme: TextTheme(
    //Button
    displaySmall: TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    displayMedium: TextStyle(fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.w400, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    displayLarge: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w400, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    //Clickable text
    titleSmall: TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue, fontStyle: FontStyle.italic),
    titleMedium: TextStyle(fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue, fontStyle: FontStyle.italic),
    titleLarge: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w500, color: Colors.blue, fontStyle: FontStyle.italic),

    bodySmall:TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    bodyMedium:TextStyle(fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.w400, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    bodyLarge:TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w400, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    //Hints
    labelSmall: TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xff949494), fontStyle: FontStyle.italic),
    labelMedium: TextStyle(fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.w400, color: const Color(0xff949494), fontStyle: FontStyle.italic),
    labelLarge: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w400, color: const Color(0xff949494), fontStyle: FontStyle.italic),

    headlineSmall: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w600, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    headlineMedium: TextStyle(fontFamily: "Poppins", fontSize: 28, fontWeight: FontWeight.w700, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    headlineLarge: TextStyle(fontFamily: "Poppins", fontSize: 32, fontWeight: FontWeight.w800, color: const Color(0xffffffff), fontStyle: FontStyle.normal),

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xff166753),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
    dialogBackgroundColor:const Color(0xff1D1617),
    extensions: <ThemeExtension<dynamic>>[
      //MapExtension("World Street map", "f3a55a52222341a7aafc793174351bb8"),
      //MapExtension("World Navigation map", "153708fd407d4f88a1be3b8fbd65b6cb"),
      MapExtension("Gray Canvas", "59548997ef4649aabe3b320a113d4097")
    ]
);