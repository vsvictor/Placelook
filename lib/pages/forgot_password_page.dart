import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TapGestureRecognizer _tapGestureLogin = TapGestureRecognizer()
    ..onTap = _onTabLogin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                TopPageWidget(AppLocalizations.of(context)!.forgot_password_title),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.enter_your_login,
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff1D1617)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.only(
                                top: 8, left: 64, right: 64, bottom: 8))),
                    child: Text(AppLocalizations.of(context)!.send,
                        style: Theme.of(context).textTheme.displayMedium,
                    ),
                    onPressed: () => {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.04, left: size.width * 0.08),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: TextSpan(
                          text: AppLocalizations.of(context)!.back_to,
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                                text: "  "+AppLocalizations.of(context)!.log_in,
                                style: Theme.of(context).textTheme.titleMedium,
                                recognizer: _tapGestureLogin)
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

  void _onTabLogin() {
    context.pop();
  }
}
