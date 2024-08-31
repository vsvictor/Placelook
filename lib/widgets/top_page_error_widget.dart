import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPageErrorWidget extends StatelessWidget {
  const TopPageErrorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Text(
            "Placelook",
            style: GoogleFonts.poppins(
              color: const Color(0xff1D1617),
              fontSize: size.height * 0.03,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Image.asset("assets/error.png"),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Text(
            "Error",
            style: GoogleFonts.poppins(
              color: const Color(0xff1D1617),
              fontSize: size.height * 0.05,
            ),
          ),
        ),
      ],
    ));
  }
}
