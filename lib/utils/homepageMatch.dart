import 'package:startup_publibid/pages/match_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class nextMatchTiles extends StatelessWidget {

  final String mainName;
  final String date;
  final String desc;
  // final String imagePath;

  const nextMatchTiles({super.key, required this.mainName, required this.date, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MatchPage())),
        child: Container(
           height: 170,
           width: 200,
           decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
           ),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8,left: 10),
                child: Text(mainName,style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                padding: const EdgeInsets.only(top:8,left: 10),
                child: Text(date,style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                padding: const EdgeInsets.only(top:8,left: 10),
                child: Text(desc,style:GoogleFonts.lato(fontSize: 16,),),
              ),
                   Padding(
                     padding: const EdgeInsets.only(top:8,left: 10),
                     child: Text('ImagePath',style: GoogleFonts.lato(fontSize: 16,),),
                   ),
                ],
              )
                ],
              )
            ],
           ),
        ),
      ),
    );
  }
}