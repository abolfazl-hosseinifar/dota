// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/heros.dart' as hero1;

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({super.key, required this.hero});

  // Declare a field that holds the Todo.
  final hero1.Hero hero;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF02282b),
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(
          hero.name ?? "Dota 2",
          style: GoogleFonts.cabinSketch(
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF02282b),
        //backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 250,
                width: width,
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Color(0xFF02282b),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.92],
                  ),
                ),
                child: Image.network(
                  hero.imgList ?? "",
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: Text(
                  hero.name ?? "",
                  style: GoogleFonts.cabinSketch(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 48, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    hero.description ?? "",
                    style: GoogleFonts.vazirmatn(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
