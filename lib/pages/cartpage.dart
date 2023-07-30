import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DataDisplayWidget extends StatelessWidget {
  final void Function(int) onBalanceValueReceived;
  const DataDisplayWidget({super.key, required this.onBalanceValueReceived});

  @override
  Widget build(BuildContext context) {
    final currentUserEmail = FirebaseAuth.instance.currentUser?.email;
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('wallet')
          .where('email', isEqualTo: currentUserEmail)
          .snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;

          int balance = 0;
          if (docs.isNotEmpty) {
            final data = docs[0].data();
            balance = data['balance'] as int;
          }
          onBalanceValueReceived(balance);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
