import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:startup_publibid/navBarPages/wallet.dart';
import '../navBarPages/portfolioPage.dart';
import 'home_page.dart';

class nav extends StatelessWidget {
  const nav({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
      body: PersistentTabView(
        context,
        screens: Screens(),
        controller: controller,
        items: navBarItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.deepPurple,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }
}

// ignore: non_constant_identifier_names
List<Widget> Screens() {
  return [
    const homepage(),
    portfolio(),
    WalletPage(),
    myProfile()
  
  ];
}

List<PersistentBottomNavBarItem> navBarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: 'Home',
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.briefcase_fill),
      title: 'portfolio',
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.wallet),
      title: 'Wallet',
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: 'Home',
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.white,
    ),
  ];
}

class porfolio extends StatelessWidget {
  const porfolio({super.key, required List<QueryDocumentSnapshot<Object?>> collectionTwoData, required double balance});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('P O R T F O L I O')),
    );
  }
}

class myProfile extends StatelessWidget {
  const myProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('P R O F I L E')),
    );
  }
}

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> userArgs =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

//     final String firstName = userArgs['firstName'] ?? '';
//     final String lastName = userArgs['lastName'] ?? '';
//     final String email = userArgs['email'] ?? '';
//     final int age = userArgs['age'] ?? 0;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('First Name: $firstName'),
//             Text('Last Name: $lastName'),
//             Text('Email: $email'),
//             Text('Age: $age'),
//             // Add more user information as needed
//           ],
//         ),
//       ),
//     );
//   }
// }