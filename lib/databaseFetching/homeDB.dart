import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startup_publibid/pages/match_page.dart';

class database extends StatelessWidget {
  const database({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
  stream: FirebaseFirestore.instance.collection('homePage').snapshots(),
  builder: (_, snapshot) {
    if (snapshot.hasError) return Text('Error = ${snapshot.error}');

    if (snapshot.hasData) {
      final docs = snapshot.data!.docs;
      return Expanded(
        child: ListView.builder(
            itemCount: docs.length,
            itemBuilder: (_, i) {
              final data = docs[i].data();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MatchPage())),
                  child: Container(
                    
                    decoration: BoxDecoration(color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(CupertinoIcons.game_controller_solid,color: Colors.white,),
                      title: Text(data['orgName'],style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(data['description'],style: GoogleFonts.lato(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)),
                      ),
                      trailing: Text(data['date'],style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,)),
                      
                    ),
                  ),
                ),
              );
            },
          ),
      );
    }

    return const Center(child: CircularProgressIndicator());
  },
);
  }
}