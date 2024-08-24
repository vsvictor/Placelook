import 'package:Placelook/pages/auth_page.dart';
import 'package:Placelook/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';
import '../viewmodel/user_model;.dart';

class MainPage extends StatefulWidget {
  const MainPage();
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthPage();
  }

  void loadUser(BuildContext context) async {
    var u = await UserModel.fromStorage();
    if (u != null) {
      setState(() {
        ProfileWidget.of(context)?.profile = u;
      });
    }
  }

  Future showAlertDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Post-Rerender Dialog"),
          content: const Text(
            "This dialog appears after the UI has rerendered.",
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
