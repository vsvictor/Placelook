import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:placelook/pages/map_page.dart';
import 'package:placelook/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreen() => [const MapPage(), const ProfilePage()];
    List<PersistentBottomNavBarItem> builItems() => [
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage("assets/walk.png")),
        title: "Walk",
        activeColorPrimary: Colors.white,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const ImageIcon(AssetImage("assets/profile.png")),
        title: "Profile",
        activeColorPrimary: Colors.white,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      )
    ];
    return PersistentTabView(
      context,
      controller: _controller,
      screens: buildScreen(),
      items: builItems(),
      neumorphicProperties: const NeumorphicProperties(bevel: 0, border: null),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
      navBarStyle: NavBarStyle.neumorphic,
      backgroundColor: const Color(0xff1D1617),
    );
  }
}
