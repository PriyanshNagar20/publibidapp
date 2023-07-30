import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startup_publibid/pages/home_page.dart';

// ignore: must_be_immutable
class cart1 extends StatelessWidget {
  double totalPlayerPrice = 0; // Move totalPlayerPrice here
  dynamic balance = 0;
  final currentUserEmail = FirebaseAuth.instance.currentUser?.email;

//   Future<void> storeDataInNewCollection(List<Map<String, dynamic>> data) async {
//   // Create a new collection named 'new_collection'
//   final newCollectionRef = FirebaseFirestore.instance.collection('new_collection');

//   // Loop through the data and add each document to the new collection
//   for (var docData in data) {
//     await newCollectionRef.add(docData);
//   }
// }

  Future<void> handlePayment() async {
    // Fetch the current user's wallet document

    final walletSnapshot = await FirebaseFirestore.instance
        .collection('wallet')
        .where('email', isEqualTo: currentUserEmail)
        .get();

    if (walletSnapshot.docs.isNotEmpty) {
      final walletDocRef = walletSnapshot.docs[0].reference;
      final currentBalance = walletSnapshot.docs[0]['balance'];

      // Subtract the totalPlayerPrice from the current balance
      final newBalance = currentBalance - totalPlayerPrice;

      if (newBalance < 0) {
        // If the new balance is negative, show a Snackbar
        return; // Stop further processing
      } else {
        // Update the balance in the wallet collection
        await walletDocRef.update({'balance': newBalance});

        // Update the local balance variable as well
        balance = newBalance;

        final collectionTwoSnapshot =
            await FirebaseFirestore.instance.collection('bid').get();

        // Store the data in a new collection
        // final collectionTwoData = collectionTwoSnapshot.docs.map((doc) => doc.data()).toList();
        // await storeDataInNewCollection(collectionTwoData);

        // Delete the data from the "bid" collection
        for (var doc in collectionTwoSnapshot.docs) {
          await doc.reference.delete();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserEmail = FirebaseAuth.instance.currentUser?.email;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'C A R T',
          style: GoogleFonts.lato(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.grey[300],
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => homepage())),
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Fetch data from Collection One
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('wallet')
                  .where('email', isEqualTo: currentUserEmail)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Data is available
                  final collectionOneData =
                      snapshot.data!.docs; // List of documents
                  // Process the data as needed...s

                  if (collectionOneData.isNotEmpty) {
                    balance = collectionOneData[0]['balance'];

                    // Subtract the total player price from the user's balance
                    // double remainingBalance = (balance - totalPlayerPrice);

                    // print(remainingBalance);

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          // Text('Data from Collection One:'),
                          for (var doc in collectionOneData)
                            Text(
                              'Available Balance: \$${doc['balance']}'
                                  .toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                        ],
                      ),
                    );
                  } else {
                    // Data is loading or not available
                    return Text('Loading...');
                  }
                }
                return Text('done');
              },
            ),

            SizedBox(height: 10),

            // Fetch data from Collection Two
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('bid').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Data is available
                  final collectionTwoData =
                      snapshot.data!.docs; // List of documents
                  // Process the data as needed...
                  totalPlayerPrice = collectionTwoData.fold<double>(
                    0,
                    (total, doc) => total + (doc['playerPrice']),
                  );

                  print(totalPlayerPrice);
                  return Column(
                    children: [
                      // Text('Data from Collection Two:'),
                      for (var doc in collectionTwoData)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 12),
                          child: Container(
                              padding: EdgeInsets.all(12),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.deepPurple),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(doc['PlayerName'],
                                      style: GoogleFonts.lato(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(doc['PlayerTeam'],
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text(doc['playerPrice'].toString(),
                                          style: GoogleFonts.lato(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ],
                                  )
                                ],
                              )),
                        ),
                    ],
                  );
                } else {
                  // Data is loading or not available
                  return Text('Loading...');
                }
              },
            ),

            const SizedBox(
              height: 15,
            ),

            Center(
              child: GestureDetector(
                onTap: () async {
                  await handlePayment();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homepage()));
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Pay',
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
