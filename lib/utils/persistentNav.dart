import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:startup_publibid/pages/home_page.dart';

class persistentNav extends StatelessWidget {
  const persistentNav({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: Screens(),
      items: navBarItems(),
      navBarStyle: NavBarStyle.neumorphic,
    );
  }
}

List<Widget> Screens() {
  return [
    homepage(),
    porfolio(),
    wallet(),
    porfolio(),
  ];
}

List<PersistentBottomNavBarItem> navBarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: 'Home',
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.deepPurple,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.briefcase_fill),
      title: 'portfolio',
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.deepPurple,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.wallet),
      title: 'Wallet',
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.deepPurple,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: 'Home',
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.deepPurple,
    ),
  ];
}

class profile extends StatelessWidget {
  const profile({super.key, required String firstName, required String lastName, required String email, required int age});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('P R O F I L E')),
    );
  }
}

class wallet extends StatelessWidget {
  const wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('W A L L E T')),
    );
  }
}

class porfolio extends StatelessWidget {
  const porfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('P O R T F O L I O')),
    );
  }
}
