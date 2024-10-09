import 'package:Placelook/main.dart';
import 'package:Placelook/model/profile.dart';
import 'package:Placelook/model/user.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/widgets/top_page_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  //late final UserViewModel vm;
  late final TapGestureRecognizer _tapGestureLogin;
  final TextEditingController teLogin = TextEditingController();
  final TextEditingController tePassword = TextEditingController();
  final TextEditingController teConfirm = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tapGestureLogin = TapGestureRecognizer()..onTap = _onTabLogin;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //vm = context.read<UserViewModel>();
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopPageWidget(AppLocalizations.of(context)!.sign_in_title),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.02,
                        left: size.width * 0.08,
                        right: size.width * 0.08),
                    child: TextField(
                      controller: teLogin,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.login_hint,
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff1D1617)),
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
                      controller: tePassword,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.password_hint,
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff1D1617)),
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
                      controller: teConfirm,
                      decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.confirm_password,
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff1D1617)),
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
                      child: Text(
                        AppLocalizations.of(context)!.sign_in,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      onPressed: () => {_onSignin()},
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
                                  text: "  " +
                                      AppLocalizations.of(context)!.log_in,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  recognizer: _tapGestureLogin)
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabLogin() {
    context.pop();
  }

  void _onSignin() {
    var login = teLogin.text;
    var passowrd = tePassword.text;
    var confirm = teConfirm.text;
    if (passowrd == confirm) {
      User newUser = User(login: login, password: passowrd);
      context.read<UserViewModel>().addUser(newUser, (u) {
        print(u.toString());
        context.pop();
      });
    }
  }
}
