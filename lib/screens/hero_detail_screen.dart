import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF02282b),
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: const Text("Dota 2"),
        centerTitle: true,
        backgroundColor: const Color(0xFF02282b),
        //backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Center(
        child: Text(
          "Haha You Made It!",
          style: GoogleFonts.cabinSketch(
            textStyle: const TextStyle(
                color: Color(0XFFb0e8eb),
                fontSize: 15,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
