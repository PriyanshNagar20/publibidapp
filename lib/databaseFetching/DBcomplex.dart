import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/last_pageApp.dart';
// Import the GridTileWidget

class DBcomplex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose Your Player',style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          backgroundColor: Colors.grey[300],
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(CupertinoIcons.back,color: Colors.black,)),
        ),
        backgroundColor: Colors.grey[300],
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('MatchDetailPage').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
    
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
    
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    String documentId = snapshot.data!.docs[index].id;
                    return GestureDetector(
                      onTap: () {
                        // When a GridTile is tapped, navigate to GridTileWidget and pass the document ID
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => last_Page(documentId),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:3.0,vertical: 20),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:Column(
                                children: [
                                  // const Icon(
                                  //   CupertinoIcons.collections_solid,
                                  //   color: Colors.white,
                                  // ),
                                  // const SizedBox(height: 10),
                                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                    stream: FirebaseFirestore.instance.collection("MatchDetailPage").snapshots(),
                                    builder: (_, snapshot) {
                                      if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                            
                                      if (snapshot.hasData) {
                                        final docs = snapshot.data!.docs;
                                        final data = docs[index].data();
                            
                                        return SizedBox(
                                          child: ListTile(
                                            title: Padding(
                                              padding: const EdgeInsets.only(top:10.0),
                                              child: Text(data['pName'],style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(top:15.0),
                                              child: Text(data['pTeam'],style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                            ),
                                            trailing: Padding(
                                              padding: const EdgeInsets.only(top:25.0),
                                              child: Text('\$${data['pPrice']}'.toString(),style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                            ),
                                          ),
                                        );
                                      }
                            
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                ],
                              ),
                          ),
                      ),
                    );
                  },
                );
            } else {
              return Center(child: Text('No documents found.'));
            }
          },
        ),
      ),
    );
  }
}
