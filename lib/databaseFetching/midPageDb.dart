import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class midPageDB extends StatelessWidget {
  const midPageDB({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection("MatchDetailPage").snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final data = docs[i].data();
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: GestureDetector(
                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => GridTileWidget())),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(12)),
                      child: GridTile(
                        header: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:10.0),
                            child: Text(
                              data['pTeam'],
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        footer: Center(child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:10.0),
                          child: Text("\$${data['pPrice'].toString()}",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,)),
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:15.0),
                              child: Text(data['pName'],style:  GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                            ),
                          ),
                        ),
                        // leading: const Icon(
                        //   CupertinoIcons.collections_solid,
                        //   color: Colors.white,
                        // ),
                        // title: Text(
                        //   data['pName'],
                        //   style: GoogleFonts.lato(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        // subtitle: Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 3),
                        //   child: Text(data['pTeam'],
                        //       style: GoogleFonts.lato(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       )),
                        // ),
                        // trailing: Text(data['pPrice'].toString(),style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,)),
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
