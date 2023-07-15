import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ParticleSystem extends StatefulWidget {
  const ParticleSystem({Key? key}) : super(key: key);

  @override
  State<ParticleSystem> createState() => _ParticleSystemState();
}

class _ParticleSystemState extends State<ParticleSystem>
    with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late List<Particle> particlesToRemove;
  late Ticker _ticker;
  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    particles = List.generate(1, (index) => Particle());
    particlesToRemove = List.empty(growable: true);
    _ticker = createTicker((elapsed) {
      // if (i != 40) {
      //   particles.add(Particle());
      //   i++;
      // }
      particles.add(Particle());
      for (var particle in particlesToRemove) {
        particles.remove(particle);
      }
      setState(() {});
    });
    _ticker.start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: _ParticlePainter(
          particles: particles,
          particlesToRemove: particlesToRemove,
        ),
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  List<Particle> particles;
  List<Particle> particlesToRemove;
  _ParticlePainter({
    required this.particles,
    required this.particlesToRemove,
  });
  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.setPosition(particle.x * size.width, particle.y * size.height);
      particle.update();
      canvas.drawCircle(Offset(particle.x, particle.y), 1.8,
          Paint()..color = Color.fromARGB(particle.opacity, 255, 165, 0));

      if (particle.finished()) {
        particlesToRemove.add(particle);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Particle {
  double x = doubleInRange(0, 1);
  double y = doubleInRange(0.8, 1);
  double vx = doubleInRange(-1, 1);
  double vy = doubleInRange(-5, -3);
  int opacity = 254;
  Particle();

  setPosition(double xPos, double yPos) {
    if (x < 1 && y < 1) {
      x = xPos;
      y = yPos;
    }
  }

  update() {
    x += vx;
    y += vy;
    opacity -= 2;
  }

  bool finished() {
    return opacity == 0;
  }
}

Random _random = Random();
double doubleInRange(num start, num end) {
  return _random.nextDouble() * (end - start) + start;
}
