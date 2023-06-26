import 'dart:convert';

import 'package:dota/classes/heros.dart';
import 'package:dota/screens/hero_detail_screen.dart';
import 'package:dota/screens/home.dart';
import 'package:dota/splash/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DOTA 2',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) => const MyHomePage(
              title: "DOTA 2",
            ),
        '/hero_detail_screen': (context) => const HeroDetailScreen(),
        // Add routes for your app's other screens here
      },
      // home: const MyHomePage(title: 'DOTA'),
    );
  }
}
