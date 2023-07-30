import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:startup_publibid/auth/mainpage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const publiBid());
}

// ignore: camel_case_types
class publiBid extends StatelessWidget {
  const publiBid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const mainPage(),
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
