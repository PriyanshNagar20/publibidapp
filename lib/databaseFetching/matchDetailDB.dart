// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../pages/last_page.dart';

// // ignore: camel_case_types
// class matchDetailPageDB extends StatelessWidget {
//   const matchDetailPageDB({super.key});

//   @override
//   Widget build(BuildContext context) {
//     demo() async {
//          String myDocId = 'userId';
//          DocumentSnapshot ?documentSnapshot;
//         await FirebaseFirestore.instance.collection('MatchDetailPage').doc(myDocId).get().then((value){
//           myDocId = value as String;
//         });

//      final name = documentSnapshot!['pName'];
//      final price = documentSnapshot!['pPrice'];
//     }
//     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       stream: FirebaseFirestore.instance.collection("MatchDetailPage").snapshots(),
//       builder: (_, snapshot) {
//         if (snapshot.hasError) return Text('Error = ${snapshot.error}');

//         if (snapshot.hasData) {
//           final docs = snapshot.data!.docs;
//           return Expanded(
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3),
//               itemCount: docs.length,
//               itemBuilder: (_, i) {
//                 final data = docs[i].data();
//                 return Padding(
//                   padding:
//                       const EdgeInsets.all(3),
//                   child: GestureDetector(
//                     onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ())),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.teal,
//                           borderRadius: BorderRadius.circular(12)),
//                       child: GridTile(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                           Text(data['pName'],style: GoogleFonts.lato(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),),

//                             // Text(myDocId,style: TextStyle(fontSize: 12),),

//                               Text(data['pTeam'],style: GoogleFonts.lato(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),),

//                               Text(data['pPrice'].toString(),style: GoogleFonts.lato(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),)
//                         ]),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }

//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
