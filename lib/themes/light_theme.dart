
import 'package:Placelook/themes/map_extension.dart';
import 'package:flutter/material.dart';

var plLightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    //Button
    displaySmall: TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    displayMedium: TextStyle(fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.w400, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    displayLarge: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w400, color: const Color(0xffffffff), fontStyle: FontStyle.normal),
    //Clickable text
    titleSmall: TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue, fontStyle: FontStyle.italic),
    titleMedium: TextStyle(fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue, fontStyle: FontStyle.italic),
    titleLarge: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w500, color: Colors.blue, fontStyle: FontStyle.italic),

    bodySmall:TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xff1D1617), fontStyle: FontStyle.normal),
    bodyMedium:TextStyle(fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.w400, color: const Color(0xff1D1617), fontStyle: FontStyle.normal),
    bodyLarge:TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w400, color: const Color(0xff1D1617), fontStyle: FontStyle.normal),
    //Hints
    labelSmall: TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xff949494), fontStyle: FontStyle.italic),
    labelMedium: TextStyle(fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.w400, color: const Color(0xff949494), fontStyle: FontStyle.italic),
    labelLarge: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w400, color: const Color(0xff949494), fontStyle: FontStyle.italic),

    headlineSmall: TextStyle(fontFamily: "Poppins", fontSize: 24, fontWeight: FontWeight.w400, color: const Color(0xff1D1617), fontStyle: FontStyle.normal),
    headlineMedium: TextStyle(fontFamily: "Poppins", fontSize: 28, fontWeight: FontWeight.w400, color: const Color(0xff1D1617), fontStyle: FontStyle.normal),
    headlineLarge: TextStyle(fontFamily: "Poppins", fontSize: 32, fontWeight: FontWeight.w400, color: const Color(0xff1D1617), fontStyle: FontStyle.normal),

  ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff32dcac),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
            ),
        ),
    ),
  dialogBackgroundColor: Colors.white,
  extensions: <ThemeExtension<dynamic>>[
      //MapExtension("World Street map", "ce493841056a4d1fa497fc5315d54bdc"),
      //MapExtension("World Navigation map", "bc19c34549de4000bcd91cef929420dc"),
      MapExtension("Gray Canvas", "ee8678f599f64ec0a8ffbfd5c429c896")
  ]
);