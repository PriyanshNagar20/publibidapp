import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startup_publibid/cart/cart.dart';

class last_Page extends StatefulWidget {
  final String documentId;
  last_Page(this.documentId);

  @override
  State<last_Page> createState() => _last_PageState();
}

class _last_PageState extends State<last_Page> {
  int count = 1;
  double price = 0;
  double total = 0; // Add total variable

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
          // title: Text('',style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          backgroundColor: Colors.grey[300],
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back,color: Colors.black,)),
        ),
      backgroundColor: Colors.grey[300],
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('MatchDetailPage')
            .doc(widget.documentId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data!.exists) {
              var name = snapshot.data?.get('pName');
              var teamName = snapshot.data?.get('pTeam');
              price = snapshot.data?.get('pPrice').toDouble();

              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.lato(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // 1 icon
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            CupertinoIcons.rectangle,
                                            color: Colors.white,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  teamName,
                                  style: GoogleFonts.lato(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Text(
                                    '\$${price.toStringAsFixed(2)}',
                                    style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Builder(
                                  // Wrap with Builder
                                  builder: (context) {
                                    return StatefulBuilder(
                                      // Wrap with StatefulBuilder
                                      builder: (context, setState) {
                                        return IncrementerDecrementer(
                                          Price: price,
                                          total: total,
                                          count: count,
                                          onCountChanged: (newCount, newTotal) {
                                            setState(() {
                                              total = newTotal;
                                              count = newCount;
                                            });
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('bid')
                                          .doc()
                                          .set({
                                        'PlayerName': name,
                                        'PlayerTeam': teamName,
                                        'playerPrice': total,
                                      });
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text('item is added')));
                                      // ignore: use_build_context_synchronously
                                     if(count >= 0){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => cart1()));}
                                              else{
                                                ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text('you should add more stocks')));
                                     }

                                    //  if(count>1) {Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) => cart1()));}
                                    //           else{
                                    //             ScaffoldMessenger.of(context)
                                    //       .showSnackBar(const SnackBar(
                                    //           content: Text('you should add more stocks')));
                                    //           }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.all(15),
                                      child: Center(
                                        child: Text(
                                          'Add to Cart',
                                          style: GoogleFonts.lato(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: Text('Document does not exist.'));
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

//

class IncrementerDecrementer extends StatelessWidget {
  final double Price;
  final int count;
  final double total; // Add total variable
  final Function(int, double) onCountChanged; // Adjust the callback function

  const IncrementerDecrementer({
    required this.Price,
    required this.count,
    required this.total,
    required this.onCountChanged,
  });

  void _increment() {
    double newTotal = (count + 1) * Price;
    onCountChanged(
        count + 1, newTotal); // Increment the count and update the total
  }

  void _decrement() {
    if (count > 0) {
      double newTotal = (count - 1) * Price;
      onCountChanged(
          count - 1, newTotal); // Decrement the count and update the total
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Container(
          height: 80,
          width: 160,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: _decrement,
              ),
              const SizedBox(width: 10),
              Text(
                '$count',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _increment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
