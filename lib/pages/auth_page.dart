import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatefulWidget {
  const AuthPage() : super();
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool pwVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Align(
                          child: Text(
                            "Placelook",
                            style: GoogleFonts.poppins(
                              color: const Color(0xff1D1617),
                              fontSize: size.height * 0.06,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Align(
                          child: Text(
                            "Look at the world!",
                            style: GoogleFonts.poppins(
                              color: const Color(0xff1D1617),
                              fontSize: size.height * 0.04,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Align(
                          child: Gif(
                            autostart: Autostart.loop,
                            placeholder: (context) => const Center(
                                child: CircularProgressIndicator()),
                            image: const AssetImage('assets/rick.gif'),
                            height: size.height * 0.2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.05,
                            left: size.width * 0.08,
                            right: size.width * 0.08),
                        child: Align(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Login",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: const Color(0xff1D1617)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.02,
                            left: size.width * 0.08,
                            right: size.width * 0.08),
                        child: Align(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: const Color(0xff1D1617)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.025, right: size.width * 0.08),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(
                                text: "Forgot password?",
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                                children: [
                                  TextSpan(
                                      text: " Here!",
                                      style: GoogleFonts.poppins(
                                        color: Colors.blue,
                                        fontSize: size.height * 0.02,
                                      ))
                                ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/google.png",
                                width: 75, height: 75),
                            Container(width: 50),
                            Image.asset("assets/facebook.png",
                                width: 75, height: 75)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.04, left: size.width * 0.08),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                text: "Don't have an account?",
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                                children: [
                                  TextSpan(
                                      text: " Sign in!",
                                      style: GoogleFonts.poppins(
                                        color: Colors.blue,
                                        fontSize: size.height * 0.02,
                                      ))
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}