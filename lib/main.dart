import 'package:flutter/material.dart';
import 'package:placelook/pages/auth_page.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Palcelook",
        home: AuthPage());
  }
}
