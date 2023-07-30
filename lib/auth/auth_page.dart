import 'package:flutter/material.dart';
import 'package:startup_publibid/pages/login.dart';
import 'package:startup_publibid/pages/register.dart';

class authPage extends StatefulWidget {
  const authPage({super.key});

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  bool show = false;

  void toggleScreens(){
    setState(() {
      show = !show;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(show){
      return loginPage(showLoginRegister: toggleScreens);
    }
    else{
      return registration(showLoginRegister: toggleScreens);
    }
  }
}