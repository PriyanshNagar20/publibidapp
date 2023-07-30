import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registration extends StatefulWidget {
  final VoidCallback showLoginRegister;
  const registration({super.key, required this.showLoginRegister});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  // GlobalKey<FormState> formKey = new GlobalKey();
  bool? checkBoxValue = false;
  // final nameController = TextEditingController();
  // final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();


  Future signup() async {
    if(passwordConfirm()){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordConfirmController.text.trim()
    );

     addUserDetails(
          firstNameController.text.trim(),
           lastNameController.text.trim(), 
           emailController.text.trim(), 
           int.parse((ageController.text.trim())));
      
      await FirebaseFirestore.instance.collection('wallet').doc().set({
      'email': emailController.text.trim(),
      'balance': 5000,  
      });

      
  }
  
  }
  

  bool passwordConfirm(){
    if(passwordController.text.trim() == passwordConfirmController.text.trim()){
      return true;
    }
    else
    return false;
  }

  Future addUserDetails(String firstName , String lastName,String email, int age,)async {
    await FirebaseFirestore.instance.collection('user').add({
    'FirstName': firstName,
    'lastName': lastName,
    'age' : age,
    'email' : email,
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    // nameController.dispose();
    // lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            // key: formkey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //hello there
              Text(
                "Hello There!",
                style: GoogleFonts.bebasNeue(fontSize: 40),
              ),

              Text(
                "Register Below with your Details!",
                style: GoogleFonts.lato(fontSize: 20),
              ),


              const SizedBox(
                height: 15,
              ),
              //formfield with decorations

                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                      controller: firstNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                         focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)) ,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                        hintText: "First Name",
                        hintStyle:
                            GoogleFonts.lato(fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.person,
                            color: Colors.deepPurple),
                      )),
              ),

              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                      controller: lastNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                         focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)) ,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                        hintText: "Last Name",
                        hintStyle:
                            GoogleFonts.lato(fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.person,
                            color: Colors.deepPurple),
                      )),
              ),

              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                      controller: ageController,
                      autofocus: true,
                      decoration: InputDecoration(
                         focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)) ,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                        hintText: "Age",
                        hintStyle:
                            GoogleFonts.lato(fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.person,
                            color: Colors.deepPurple),
                      )),
              ),

              const SizedBox(height: 10,),

                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                      controller: emailController,
                      autofocus: true,
                      decoration: InputDecoration(
                         focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)) ,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                        hintText: "Username",
                        hintStyle:
                            GoogleFonts.lato(fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.person,
                            color: Colors.deepPurple),
                      )),
              ),


              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    autofocus: true,
                    decoration: InputDecoration(
                       focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)) ,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
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
                child: TextField(
                    controller: passwordConfirmController,
                    obscureText: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)) ,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.deepPurple,
                        ),
                        suffixIcon: const Icon(
                          CupertinoIcons.eye_slash,
                          color: Colors.deepPurple,
                        ),
                        hintText: "Confirm Password",
                        border: InputBorder.none,
                        hintStyle:
                            GoogleFonts.lato(fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     children: [
              //       Checkbox(
              //           value: checkBoxValue,
              //           activeColor: Colors.deepPurple,
              //           onChanged: (bool? newValue) {
              //             setState(() {
              //               checkBoxValue = newValue;
              //             });
              //           }),
              //       Text(
              //         "Remember me",
              //         style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),
              //       ),
              //     ],
              //   ),
              // ),

              //another form field with decorations

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signup,
                  child: Container(
                    height: 55,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'Register',
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
                'or Register with',
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
                    "already have an account? ",
                    style: GoogleFonts.lato(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginRegister,
                    child: Text(
                      "log in",
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
