import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dota/main.dart';
import 'package:dota/widgets/particles.dart';
import 'package:dota/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool visible = false;
  late VideoPlayerController _controllerr;
  late Future<void> _initializeVideoPlayerFuture;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(1.5, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repeatOnce();
    // _controller = VideoPlayerController.asset(
    //   'assets/videos/dota.mp4',
    // );

    // _initializeVideoPlayerFuture = _controller.initialize();

    // Add a delay before navigating to the main screen
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyHomePage(
            title: "DOTA 2",
          ),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          ParticleSystem(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _offsetAnimation,
                  child: Center(
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: 100,
                      child: Image.asset("assets/images/dota2.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // AnimatedTextKit(
                //   animatedTexts: [
                //     TyperAnimatedText(
                //       'DOTA 2',
                //       textStyle: const TextStyle(
                //         fontSize: 15.0,
                //         fontFamily: 'Agne',
                //         color: Colors.red,
                //       ),
                //       speed: const Duration(milliseconds: 300),
                //     ),
                //   ],
                //   totalRepeatCount: 1,
                //   pause: const Duration(milliseconds: 2000),
                //   displayFullTextOnTap: true,
                //   stopPauseOnTap: true,
                // )
                Container(
                  height: 30,
                  child: Visibility(
                    visible: visible,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('DOTA 2',
                            textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                      isRepeatingAnimation: false,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // body: FutureBuilder(
    //   future: _initializeVideoPlayerFuture,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       _controller.play();
    //       return VideoPlayer(_controller);
    //     } else {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // ),
  }

  void repeatOnce() async {
    await _controller.forward().then((value) {
      setState(() {
        visible = true;
      });
    });
    //await _controller.reverse();
  }
}
