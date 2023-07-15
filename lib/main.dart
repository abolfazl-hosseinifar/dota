import 'dart:convert';

import 'package:dota/models/heros.dart';
import 'package:dota/view_models/heros_view_model.dart';
import 'package:dota/views/hero_detail_screen.dart';
import 'package:dota/views/home.dart';
import 'package:dota/views/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HerosViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DOTA 2',
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/main': (context) => const MyHomePage(
                title: "DOTA 2",
              ),
          // Add routes for your app's other screens here
        },
        // home: const MyHomePage(title: 'DOTA'),
      ),
    );
  }
}
