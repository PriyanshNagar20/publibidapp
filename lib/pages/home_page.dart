import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:startup_publibid/auth/auth_page.dart';
import 'package:startup_publibid/databaseFetching/homeDB.dart';
import 'package:startup_publibid/utils/homePageTopContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cart/Cart.dart';

// ignore: camel_case_types, must_be_immutable
class homepage extends StatefulWidget {
  
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    await auth.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => authPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> cart1())),
              child: const Icon(CupertinoIcons.cart,color: Colors.black,)),
          )
        ],
          title: Text('P U B L I B I D',style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
          backgroundColor: Colors.grey[300],
          elevation: 0,
          centerTitle: true,
          // leading: GestureDetector(
          //   onTap: () => Navigator.pop(context),
          //   child: const Icon(CupertinoIcons.back,color: Colors.black,)),
        ),
      floatingActionButton: FloatingActionButton(onPressed: signOut,backgroundColor: Colors.black87,child: Center(child: Icon(CupertinoIcons.delete)),),
        // bottomNavigationBar: const persistentNav(),
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MaterialButton(onPressed: FirebaseAuth.instance.signOut()),
              // persistentNav(),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return const homepageContainers();
                    }),
              ),

              const SizedBox(
                height: 18,
              ),

              //tournaments
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Tournaments",
                  style: GoogleFonts.lato(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              const database(),
            ],
          ),
        ));
  }
}
