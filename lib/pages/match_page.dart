import 'package:flutter/cupertino.dart';
import 'package:startup_publibid/cart/Cart.dart';
import 'package:startup_publibid/databaseFetching/matchPageDB.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

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
          title: Text('Choose Your Match',style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          backgroundColor: Colors.grey[300],
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(CupertinoIcons.back,color: Colors.black,)),
        ),
      backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nodwin BGMI Champions Cup",
                      style: GoogleFonts.lato(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    
                    Image.asset("lib/images/equalizer.png",height: 25,color: Colors.black,)

                  ],
                ),
              ),
              const SizedBox(height: 10),
               
              const matchPageDB(),

              // Expanded(
              //   child: SizedBox(
              //     child: GridView.builder(
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //                 crossAxisCount: 2),
              //         itemCount: matchContainer.length,
              //         itemBuilder: (context, index) {
              //           return MatchPageTile(
              //             matchNumber: matchContainer[index][0],
              //             matchBetween: matchContainer[index][1],
              //           );                      }),
              //   ),
              // )
            ],
          ),
        ));
  }
}
