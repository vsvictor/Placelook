import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placelook/pages/forgot_password_page.dart';
import 'package:placelook/pages/signin_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool pwVisible = false;
  late final TapGestureRecognizer _tapGestureSignin;
  late final TapGestureRecognizer _tapGestureForgotPassword;
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _tapGestureSignin = TapGestureRecognizer()..onTap = _onTapSignin;
    _tapGestureForgotPassword = TapGestureRecognizer()..onTap = _onTapForgotPassword;
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }
  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _tapGestureSignin.dispose();
    _tapGestureForgotPassword.dispose();
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
                              fontSize: size.height * 0.06,
                            ),
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                          child: Text(
                            "Look at the world!",
                            style: GoogleFonts.poppins(
                              color: const Color(0xff1D1617),
                              fontSize: size.height * 0.04,
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
                            height: size.height * 0.2,
                          ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.02,
                            left: size.width * 0.08,
                            right: size.width * 0.08),
                          child: TextField(
                            controller: _loginController,
                            decoration: InputDecoration(
                              hintText: "Login",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff1D1617)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.02,
                            left: size.width * 0.08,
                            right: size.width * 0.08),
                          child: TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff1D1617)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
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
                          child: Text("Login",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.height * 0.03,
                              )),
                          onPressed: () => {

                          },
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
                                      ), recognizer: _tapGestureForgotPassword)
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
                                      text: "  Sign in!",
                                      style: GoogleFonts.poppins(
                                        color: Colors.blue,
                                        fontSize: size.height * 0.02,
                                      ),
                                      recognizer: _tapGestureSignin)
                                ]),
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
  void _onTapSignin(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SigninPage()),
    );
  }
  void _onTapForgotPassword(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
    );
  }
}
