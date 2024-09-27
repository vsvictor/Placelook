import 'package:Placelook/pages/signin_page.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                TopPageWidget(AppLocalizations.of(context)!.log_in),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.08,
                      right: size.width * 0.08),
                  child: TextField(
                    controller: _loginController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.login_hint,
                      hintStyle: Theme.of(context).textTheme.labelMedium,
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
                      hintText: AppLocalizations.of(context)!.password_hint,
                      hintStyle: Theme.of(context).textTheme.labelMedium,
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
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.only(
                                top: 8, left: 64, right: 64, bottom: 8))),
                    child: Text("Login",
                        style: Theme.of(context).textTheme.displayMedium,
                    ),
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
                          text: AppLocalizations.of(context)!.forgot_password,
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                                text: "  "+AppLocalizations.of(context)!.here,
                                style: Theme.of(context).textTheme.titleMedium,
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
                          text: AppLocalizations.of(context)!.do_not_account,
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                                text: "  "+AppLocalizations.of(context)!.sign_in,
                                style: Theme.of(context).textTheme.titleMedium,
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
    context.pushNamed("signin");
  }

  void _onTapForgotPassword() {
    context.pushNamed("forgot");
  }
}
