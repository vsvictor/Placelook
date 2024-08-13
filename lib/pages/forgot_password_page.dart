import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TapGestureRecognizer _tapGestureLogin;
  @override
  void initState() {
    super.initState();
    _tapGestureLogin = TapGestureRecognizer()..onTap = _onTabLogin;
  }
  @override
  void dispose() {
    _tapGestureLogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
              child:
                SingleChildScrollView(
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
                            placeholder: (context) => const Center(
                                child: CircularProgressIndicator()),
                            image: const AssetImage('assets/rick.gif'),
                            height: size.height * 0.15,
                          ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),

                          child: Text(
                            "Forgot password",
                            style: GoogleFonts.poppins(
                              color: const Color(0xff1D1617),
                              fontSize: size.height * 0.05,
                            ),
                          ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.02,
                            left: size.width * 0.08,
                            right: size.width * 0.08),

                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Enter your login",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff1D1617)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      const Color(0xff1D1617)),
                                  padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      const EdgeInsets.only(
                                          top: 8,
                                          left: 64,
                                          right: 64,
                                          bottom: 8))),
                              child: Text("Send",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: size.height * 0.03,
                                  )),
                              onPressed: () => {},
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04, left: size.width * 0.08),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: RichText(
                            text: TextSpan(
                                text: "Back to",
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                                children: [
                                  TextSpan(
                                      text: "  login!",
                                      style: GoogleFonts.poppins(
                                        color: Colors.blue,
                                        fontSize: size.height * 0.02,
                                      ),
                                      recognizer: _tapGestureLogin)
                                ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
          ),
        ),
      ),
    );
  }
  void _onTabLogin(){
    Navigator.pop(context);
  }

}
