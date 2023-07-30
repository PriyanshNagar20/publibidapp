import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:startup_publibid/auth/auth_page.dart';
import 'package:startup_publibid/pages/navbar.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  // User? user;

  // @override
  // void initState() {
  //   user = FirebaseAuth.instance.currentUser;
  //   print('uid is'+user!.uid);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const nav();
          } else {
            return authPage();
          }
        });
  }
}
