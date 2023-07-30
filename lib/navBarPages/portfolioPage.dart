import 'package:flutter/material.dart';
// ignore: camel_case_types, must_be_immutable
class portfolio extends StatefulWidget {
  // final List<QueryDocumentSnapshot> collectionTwoData;
  // final double balance;
  portfolio({super.key,});

  @override
  State<portfolio> createState() => _portfolioState();
}

class _portfolioState extends State<portfolio> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          Text('P O R T F O L I O'),
        ],),
      )
    );
  }
}