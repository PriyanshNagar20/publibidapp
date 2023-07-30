import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class recentOrderDB extends StatelessWidget {
  const recentOrderDB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double balance = 5000;
    double total = 0;
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection("bid").snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;

          return Expanded(
            child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final data = docs[i].data();
                total = 0;
                docs.forEach((doc) {
                  final data = doc.data();
                  double playerPrice = data['playerPrice'] ?? 0;
                  total += playerPrice;
                });

                print(balance-total);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      // leading: Text(total.toString()),
                      title: Text(
                        data['PlayerName'],
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(data['PlayerTeam'],
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      trailing: Text('\$${data['playerPrice'].toString()}',
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RecentOrderDB extends StatefulWidget {
//   const RecentOrderDB({super.key});

//   @override
//   _RecentOrderDBState createState() => _RecentOrderDBState();
// }

// class _RecentOrderDBState extends State<RecentOrderDB> {
//   double total = 0;
//   double balance = 5000;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( // Add the Scaffold widget to provide constraints for the layout
//       appBar: AppBar(
//         title: Text('Recent Orders'),
//       ),
//       body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: FirebaseFirestore.instance.collection("bid").snapshots(),
//         builder: (_, snapshot) {
//           if (snapshot.hasError) return Text('Error = ${snapshot.error}');

//           if (snapshot.hasData) {
//             final docs = snapshot.data!.docs;

//             // Calculate the total by summing up player prices
//             total = 0;
//             docs.forEach((doc) {
//               final data = doc.data();
//               double playerPrice = data['playerPrice'] ?? 0;
//               total += playerPrice;
//             });

//             // Update the balance by subtracting the total from the initial value
//             balance = balance - total;

//                   return Expanded(
//                     child: ListView.builder(
//                       itemCount: docs.length,
//                       itemBuilder: (_, i) {
//                         final data = docs[i].data();
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 12, vertical: 5),
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.teal,
//                                 borderRadius: BorderRadius.circular(12)),
//                             child: ListTile(
//                               leading: Text(balance.toString(),style: GoogleFonts.lato(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),),
//                               title: Text(
//                                 data['PlayerName'],
//                                 style: GoogleFonts.lato(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               subtitle: Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 3),
//                                 child: Text(data['PlayerTeam'],
//                                     style: GoogleFonts.lato(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     )),
//                               ),
//                               trailing: Text(
//                                 '\$${data['playerPrice'].toString()}',
//                                 style: GoogleFonts.lato(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             );
//           }

//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
