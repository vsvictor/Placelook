import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:placelook/pages/map_page.dart';
import 'package:placelook/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreen(),
      items: _builItems(),
      neumorphicProperties: NeumorphicProperties(bevel: 0, border: null),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
      navBarStyle: NavBarStyle.neumorphic,
      backgroundColor: Color(0xff1D1617),
    );
  }

  List<Widget> _buildScreen() => [MapPage(), ProfilePage()];
  List<PersistentBottomNavBarItem> _builItems() => [
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
}
