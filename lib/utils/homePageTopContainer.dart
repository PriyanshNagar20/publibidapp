import 'package:flutter/material.dart';

class homepageContainers extends StatelessWidget {
  const homepageContainers ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Image.asset('lib/images/game.jpg',fit: BoxFit.contain,height: 100,),
        height: 150,
        width: 370,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}