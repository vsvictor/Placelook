import 'package:Placelook/pages/signin_page.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Placelook/pages/forgot_password_page.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late UserViewModel vm;
  late final TapGestureRecognizer _tapGestureSignin = TapGestureRecognizer()
    ..onTap = _onTapSignin;
  late final TapGestureRecognizer _tapGestureForgotPassword =
      TapGestureRecognizer()..onTap = _onTapForgotPassword;
  late final TextEditingController _loginController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (vm.user == null) {
        vm.fromStorage();
        _loginController.text = vm.user?.email ?? "";
        vm.login = _loginController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    vm = Provider.of<UserViewModel>(context);
    if (_loginController.text.trim().isEmpty) {
      _loginController.text = (vm.user != null) ? vm.user!.email ?? "" : "";
      vm.login = _loginController.text;
    }
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const TopPageWidget("Log in"),
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
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (String l) => {
                      if (l.isNotEmpty) {vm.login = l}
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (String p) => {vm.password = p},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xff1D1617)),
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.only(
                                top: 8, left: 64, right: 64, bottom: 8))),
                    child: Text("Login",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.height * 0.03,
                        )),
                    onPressed: () => {_onLogin()},
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
                                ),
                                recognizer: _tapGestureForgotPassword)
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/google.png", width: 75, height: 75),
                      Container(width: 50),
                      Image.asset("assets/facebook.png", width: 75, height: 75)
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
          )),
        ),
      ),
    );
  }

  void _onLogin() async {
    vm.login = "dvictor74@gmail.com";
    vm.password = "qwerty";
    await vm.startApp();
    if (vm.user != null) {
      context.pushReplacement("/");
    }
  }

  void _onTapSignin() {
    context.push("/auth/signin");
  }

  void _onTapForgotPassword() {
    context.push("/auth/forgot");
  }
}
