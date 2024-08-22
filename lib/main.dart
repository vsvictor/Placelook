import 'package:Placelook/model/user.dart';
import 'package:Placelook/pages/main_page.dart';
import 'package:Placelook/viewmodel/user_view_model.dart';
import 'package:Placelook/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileWidget(
        child: MaterialApp(
            //debugShowMaterialGrid: true,
            debugShowCheckedModeBanner: false,
            title: "Placelook",
            home: MainPage()));
  }
}
