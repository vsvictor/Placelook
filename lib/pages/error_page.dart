import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/top_page_error_widget.dart';
import '../widgets/top_page_widget.dart';

class ErrorPage extends StatefulWidget {
  final String? message;
  const ErrorPage({this.message = ""});
  @override
  State<ErrorPage> createState() => _ErrorPageState(message);
}

class _ErrorPageState extends State<ErrorPage> {
  final String? message;
  _ErrorPageState(this.message);
  late final TapGestureRecognizer _tapGestureLogin = TapGestureRecognizer()
    ..onTap = _onBack;
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
              child: SingleChildScrollView(
            child: Column(
              children: [
                const TopPageErrorWidget(),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: Text(
                    message ?? "No message",
                    style: GoogleFonts.poppins(
                      color: Colors.blue,
                      fontSize: size.height * 0.06,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xff1D1617)),
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.only(
                                top: 8, left: 64, right: 64, bottom: 8))),
                    child: Text("Back",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.height * 0.03,
                        )),
                    onPressed: () => {_onBack()},
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  void _onBack() {
    context.go("/auth");
  }
}
