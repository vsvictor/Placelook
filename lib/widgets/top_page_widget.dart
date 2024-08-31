import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPageWidget extends StatelessWidget {
  final String header;
  const TopPageWidget(this.header, {super.key});
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
          child: Gif(
            autostart: Autostart.loop,
            placeholder: (context) =>
                const Center(child: CircularProgressIndicator()),
            image: const AssetImage('assets/rick.gif'),
            height: size.height * 0.15,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Text(
            header,
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
