import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridTileWidget extends StatelessWidget {
  final String documentId;

  GridTileWidget(this.documentId, Object? documentData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document ID: $documentId'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('MatchDetailPage').doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            if (snapshot.data!.exists) {
              // Access the fields from the document data
              var field1 = snapshot.data?.get('pName');
              var field3 = snapshot.data?.get('pTeam');
              var field2 = snapshot.data?.get('pPrice');

              // Display the fields in a ListView or any other widget
              return ListView(
                children: [
                  ListTile(
                    title: Text('Field 1: $field1'),
                  ),
                  ListTile(
                    title: Text('Field 2: $field2'),
                  ),
                  ListTile(
                    title: Text('Field 3: $field3'),
                  ),
                  // Add more ListTiles for other fields if needed
                ],
              );
            } else {
              return Center(child: Text('Document does not exist.'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
