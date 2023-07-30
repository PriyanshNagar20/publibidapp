import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  final VoidCallback showLoginRegister;
  const loginPage({super.key, required this.showLoginRegister});

  @override
  State<loginPage> createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<loginPage> {
  final formkey = GlobalKey<FormState>();
  bool? checkBoxValue = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.lock, size: 80, color: Colors.deepPurple),
              const SizedBox(
                height: 5,
              ),
              //hello there
              Text(
                "Hello There!",
                style: GoogleFonts.bebasNeue(fontSize: 52),
              ),
              //we've missed you welcome again

              Text(
                "Welcome Back You\'ve been missed",
                style:
                    GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 30,
              ),
              //formfield with decorations

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:  TextFormField(
                      validator: (value) {
                        if (value == null && value!.length < 7) ;
                        return 'please enter valid username';
                      },
                      controller: emailController,
                      autofocus: true,
                      decoration: InputDecoration(
                        focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)) ,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                        hintText: "Username",
                        hintStyle:
                            GoogleFonts.lato(fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.deepPurple),
                      )
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)) ,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.deepPurple,
                        ),
                        suffixIcon: const Icon(
                          CupertinoIcons.eye_slash,
                          color: Colors.deepPurple,
                        ),
                        hintText: "Password",
                        border: InputBorder.none,
                        hintStyle:
                            GoogleFonts.lato(fontWeight: FontWeight.bold)),
                  ),
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue,
                        activeColor: Colors.deepPurpleAccent,
                        onChanged: (bool? newValue) {
                          setState(() {
                            checkBoxValue = newValue;
                          });
                        }),
                    Text(
                      "Remember me",
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),

              //another form field with decorations
              const SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    height: 55,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              Text(
                'or Login with',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.deepPurple),
              ),

              const SizedBox(
                height: 18,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => print("google tapped"),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'lib/images/google.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print("apple tapped"),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'lib/images/apple-logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: GoogleFonts.lato(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginRegister,
                    child: Text(
                      "Register Now",
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
