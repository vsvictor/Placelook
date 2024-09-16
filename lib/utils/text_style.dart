import 'package:flutter/material.dart';

//TextStyle plNormalTextStyle({Color color = const Color(0xff1D1617),required double fontSize}) => TextStyle(fontFamily: "Poppins", color: color, fontSize: fontSize);
class PLNormalTextStyle extends TextStyle {
  PLNormalTextStyle(
      {Color color = const Color(0xff1D1617), double fontSize = 16.0})
      : super(fontFamily: "Poppins", color: color, fontSize: fontSize);
}

class PLNormalBoldTextStyle extends TextStyle {
  PLNormalBoldTextStyle(
      {Color color = const Color(0xff1D1617), double fontSize = 16.0})
      : super(
            fontFamily: "Poppins",
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w600);
}

class PLNormalItalicTextStyle extends TextStyle {
  PLNormalItalicTextStyle(
      {Color color = const Color(0xff1D1617), double fontSize = 16.0})
      : super(
            fontFamily: "Poppins",
            color: color,
            fontSize: fontSize,
            fontStyle: FontStyle.italic);
}

class PLTitleTextStyle extends TextStyle {
  PLTitleTextStyle(
      {Color color = const Color(0xff1D1617), double fontSize = 20.0})
      : super(fontFamily: "Poppins", color: color, fontSize: fontSize);
}

class PLBigTextStyle extends TextStyle {
  PLBigTextStyle(
      {Color color = const Color(0xff1D1617), double fontSize = 24.0})
      : super(fontFamily: "Poppins", color: color, fontSize: fontSize);
}
